class Team < ApplicationRecord
  validates :name, presence: true
  has_many :team_members
end
