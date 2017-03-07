class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :user_name
      t.text :bio
      t.string :full_name
      t.integer :age
      
      t.timestamps
    end
  end
end
