class Event < ActiveRecord::Base
  has_many :entries

  validates :name, presence: true

  def to_s
    "%2d: %s"%[self.number, self.name]
  end

  def self.as_options
    self.order('number, name').map {|_| [_.to_s, _.id] }
  end
end
