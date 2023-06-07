class Pet < ApplicationRecord
  belongs_to :user
  has_many :adoption_requests
  has_many :users, through: :adoption_requests

  validates :name, presence: true
end
