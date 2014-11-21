class User < ActiveRecord::Base
  belongs_to :title
  has_and_belongs_to_many :skills
  has_many :allocations

  # enum ties a numerical value in the database to named values that can be accessed in rails.
  # http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  # You can access these like this:
  # user = User.first
  # user.employee!  # This sets the status to employee
  # user.role => "employee"
  # user.employee? => true
  enum role: [:admin, :employee]

  has_secure_password

  before_create :set_token

  private
    def set_token
      return if token.present?
      self.token = generate_token
    end

    def generate_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
end
