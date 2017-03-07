class AddGroupToSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :slides, :group_id, :integer
  end
end
