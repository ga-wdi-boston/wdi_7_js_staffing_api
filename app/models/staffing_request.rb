class StaffingRequest < ActiveRecord::Base
  belongs_to :title
  belongs_to :project
  has_and_belongs_to_many :skills
  has_many :allocations

  enum status: [:open, :filled, :closed]
end
