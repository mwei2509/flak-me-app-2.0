class Events < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :group
      t.references :user
      t.string :name
      t.datetime :event_start
      t.datetime :event_end
      t.text :description

    end
  end
end
