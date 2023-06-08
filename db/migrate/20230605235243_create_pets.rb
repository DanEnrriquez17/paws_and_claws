class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.boolean :adopted, null: false,default: false
      t.string :species
      t.string :breed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
