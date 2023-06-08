class AdoptionRequest < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :status, presence: {inclusion: { in: ["pending", "accepted", "declined"]}}
end
