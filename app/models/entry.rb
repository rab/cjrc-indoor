class Entry < ActiveRecord::Base
  belongs_to :event

  validates :last_name, :first_name, presence: true

  def to_s
    result = [self.last_name, self.first_name].compact.join(' ')
    result << " [#{self.event}]" if self.event
    result << " Ltwt" if self.lightweight?
    result
  end
end
