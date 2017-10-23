class Sprint < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :sprint_assignments
end
