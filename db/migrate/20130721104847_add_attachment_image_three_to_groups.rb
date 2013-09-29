class AddAttachmentImageThreeToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :image_three
    end
  end

  def self.down
    drop_attached_file :groups, :image_three
  end
end
