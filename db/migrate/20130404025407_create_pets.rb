class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :breed
      t.integer :amount
      t.binary :special_instructions
      t.integer :user_id

      t.timestamps
    end
  end
end
