class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :subject
      t.binary :content
      t.integer :to_user
      t.integer :from_user

      t.timestamps
    end
  end
end
