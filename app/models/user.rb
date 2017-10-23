class User < ApplicationRecord
  include Filterable
  
  validates :short_name, presence:true, uniqueness: true
  validates :surname, presence:true
  has_many :modification_analyses, foreign_key: 'analyst_id', class_name: 'Modification'
  has_many :team_members
  
  scope :short_name, -> (short_name) { where short_name: short_name }
  scope :starts_with, -> (name) { where("surname like ?", "#{name}%")}
end
