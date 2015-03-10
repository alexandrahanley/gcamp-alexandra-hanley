class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  enum role: {member: 0, owner: 1}

  validates :user_id, presence: true
  validates :user_id, uniqueness: {scope: :project_id, message: "was already added to this project."}

end
