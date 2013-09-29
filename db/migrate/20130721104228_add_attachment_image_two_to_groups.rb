class AddAttachmentImageTwoToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :image_two
    end
  end

  def self.down
    drop_attached_file :groups, :image_two
  end
end
