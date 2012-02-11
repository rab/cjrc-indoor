class Assignment < ActiveRecord::Base
  belongs_to :race
  belongs_to :entry
end
