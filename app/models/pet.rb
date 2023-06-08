class Pet < ApplicationRecord
  CATEGORIES = ["Dog", "Cat", "Both"]
  belongs_to :user
  has_many :adoption_requests
  has_many :users, through: :adoption_requests

  validates :name, :species, :breed, :age, presence: true
  validates :species, inclusion: { in: CATEGORIES }
  has_one_attached :photo
end
