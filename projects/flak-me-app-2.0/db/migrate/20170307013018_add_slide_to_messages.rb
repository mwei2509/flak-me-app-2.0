class AddSlideToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :slide_id, :integer
  end
end
