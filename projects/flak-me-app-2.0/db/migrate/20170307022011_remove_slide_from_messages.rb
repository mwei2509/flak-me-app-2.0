class RemoveSlideFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :slide_id
  end
end
