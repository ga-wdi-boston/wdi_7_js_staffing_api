class User < ActiveRecord::Base
  belongs_to :title
  has_and_belongs_to_many :skills
  has_many :allocations

  enum role: [:admin, :employee]
end
