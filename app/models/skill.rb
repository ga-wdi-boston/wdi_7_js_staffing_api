class Skill < ActiveRecord::Base
  # We haven't directly used this association in class.
  # It is similar to has_many :through, however the intermediary table isn't directly accessible
  # More on it here: http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
	has_and_belongs_to_many :users
	has_and_belongs_to_many :staffing_requests
end
