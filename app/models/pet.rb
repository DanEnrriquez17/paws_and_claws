class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :user, through, :adoption_requests
end
