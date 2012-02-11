class Event < ActiveRecord::Base
  has_many :entries

  validates :name, presence: true

  def entries_count
    self.entries.size
  end

  def to_s
    "%2d: %s"%[self.number, self.name]
  end

  def self.as_options
    self.order('number, name').map {|_| [_.to_s, _.id] }
  end

  def self.seed_all
    self.includes({ :entries => :event }).all.group_by(&:group).sort_by {|group,events|
      events.map(&:number).min
    }.each do |group,events|
      puts group, '='*(group.size)
      entries_to_seed = events.map(&:entries).flatten.sort_by{|_| _.score.presence || '99:99.9'}

      flight_size = (entries_to_seed.size.to_f / ((entries_to_seed.size + 11) / 12)).ceil
      seed_erg = (1..12).fill_order
      entries_to_seed.each_slice(flight_size) do |flight|
        ergs = Array(12+1)
        flight.each.with_index(0) do |rower,flight_seed|
          ergs[seed_erg[flight_seed]-1] = rower
        end
        ergs[1..-1].each.with_index(1) do |rower, erg|
          puts "%2d: %s"%[erg, rower.to_s]
        end
      end
    end
  end
end
