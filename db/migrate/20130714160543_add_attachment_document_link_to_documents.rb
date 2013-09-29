class AddAttachmentDocumentLinkToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :document_link
    end
  end

  def self.down
    drop_attached_file :documents, :document_link
  end
end
