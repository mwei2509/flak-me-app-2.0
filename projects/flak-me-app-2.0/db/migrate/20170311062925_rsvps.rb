class Rsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.references :user
      t.references :event
    end
  end
end
