class TeamMember < ApplicationRecord
  validates :team_id, :user_id, presence: true
  belongs_to :team
  belongs_to :user
end
