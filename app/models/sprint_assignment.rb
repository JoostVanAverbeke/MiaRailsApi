class SprintAssignment < ApplicationRecord
  validates :sprint_id, :modification_id, presence: true
  belongs_to :sprint
  belongs_to :modification
end
