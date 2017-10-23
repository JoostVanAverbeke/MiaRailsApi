class Modification < ApplicationRecord
  validates :short_description, :analyst_id, presence: true
  belongs_to :analyst, class_name: "User", foreign_key: 'analyst_id'
  has_many :sprint_assignments
end
