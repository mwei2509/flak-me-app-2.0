class AddAttachmentGroupImgToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :group_img
    end
  end

  def self.down
    remove_attachment :groups, :group_img
  end
end
