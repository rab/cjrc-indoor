class Race < ActiveRecord::Base
  has_many :assignments, order: :erg
  has_many :entries, through: :assignments

  def event_ids
    self.entries.map{|_|_.event_ids}.flatten.uniq
  end

  def events
    Event.where(id: self.event_ids).order(:number)
  end

  def self.as_options
    self.order('position, start_at').map {|_| [_.to_s, _.id] }
  end
end
