class CreateAdoptionRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :adoption_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
