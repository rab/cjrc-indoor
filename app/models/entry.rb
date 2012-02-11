class Entry < ActiveRecord::Base
  belongs_to :event
  has_one :assignment

  validates :last_name, :first_name, presence: true

  def race
    self.assignment && self.assignment.race
  end

  def to_s
    result = [self.last_name, self.first_name].compact.join(' ')
    result << " [#{self.event}]" if self.event
    result << " Ltwt" if self.lightweight?
    result
  end

  def self.as_options
    self.order('last_name, first_name').map {|_| [_.to_s, _.id] }
  end
end
