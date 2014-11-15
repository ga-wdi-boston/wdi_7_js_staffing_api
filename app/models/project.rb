class Project < ActiveRecord::Base
	has_many :staffing_requests
end
