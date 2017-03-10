class AddAttachmentToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :group_img, :attachment
  end
end
