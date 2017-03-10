class RemoveGroupImgFromGroups < ActiveRecord::Migration[5.0]
  def change
  	remove_column :groups, :group_img
  end
end
