class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_pets, dependent: :destroy, class_name: "Pet"

  has_many :adoption_requests, dependent: :destroy
  has_many :adoption_request_pets, through: :adoption_requests, source: :pet
  validates :age, comparison: { greater_than: 15 }
  validates :name, :last_name, :age, :preferences, :address, presence: true


  def has_an_active_request_with_this_(pet)
    self.adoption_requests.where(pet: pet).last
  end

  def owns_this_pet?(pet)
    self.owned_pets.include?(pet)
  end
end
