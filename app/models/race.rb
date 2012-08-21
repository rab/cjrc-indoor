class Race < ActiveRecord::Base
  has_many :assignments, order: :erg
  has_many :entries, through: :assignments

  def event_ids
    self.entries.map{|_|_.event_id}.flatten.uniq
  end

  def events
    Event.where(id: self.event_ids).order(:number)
  end

  def ergs
    if (self.position % 2).zero?
      13..24
    else
      1..12
    end
  end

  def boat_type
    0           # team configuration (singles=0, doubles=1, fours=2, eights=3)
  end

  def boats
    self.entries.count
  end

  def group
    self.entries.detect{|_|_}.group
  end

  def display_start_at
    if (utc_time = read_attribute(:start_at))
      utc_time.in_time_zone("Eastern Time (US & Canada)")
    end
  end

  def to_s
    "#{self.position} #{self.start_at.in_time_zone("Eastern Time (US & Canada)").strftime('%H:%M')}"
  end

  def self.as_options
    self.order('position, start_at').map {|_| [_.to_s, _.id] }
  end
end
