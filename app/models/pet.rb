class Pet < ApplicationRecord
  CATEGORIES = ["Dog", "Cat", "Both"]

  scope :available_and_recently_added, -> { available.order(created_at: :desc) }
  scope :available, -> { where(adopted: false) }

  belongs_to :user
  has_many :adoption_requests
  has_many :users, through: :adoption_requests

  validates :name, :species, :breed, :age, presence: true
  validates :species, inclusion: { in: CATEGORIES }
  has_one_attached :photo
end
