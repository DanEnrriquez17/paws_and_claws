class Pet < ApplicationRecord
  CATEGORIES = ["Dog", "Cat", "Both"]
  belongs_to :user
  has_many :adoption_requests
  has_many :users, through: :adoption_requests

  validates :name, :species, :breed, :age, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
