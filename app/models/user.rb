class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :tasks, through: :comments

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

  def owns_project?(project)
    project.memberships.find_by(role: Membership.roles["owner"], user_id: id)
  end

end
