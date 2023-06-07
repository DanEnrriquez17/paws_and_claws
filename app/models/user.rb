class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_pets, dependent: :destroy, class_name: "Pet"

  has_many :adoption_requests, dependent: :destroy
  has_many :adoption_request_pets, through: :adoption_requests, source: :pet
end
