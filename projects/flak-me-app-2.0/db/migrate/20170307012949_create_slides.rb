class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.integer :slider
      t.integer :slidee

      t.timestamps
    end
  end
end
