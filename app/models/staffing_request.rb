class StaffingRequest < ActiveRecord::Base
  belongs_to :title
  belongs_to :project
  has_and_belongs_to_many :skills
  has_many :allocations

  # enum ties a numerical value in the database to named values that can be accessed in rails.
  # http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  # You can access these like this:
  # staffing_request = StaffingRequest.first
  # staffing_request.open!  # This sets the status to open
  # staffing_request.status => "open"
  # staffing_request.open? => true
  enum status: [:open, :filled, :closed]
end
