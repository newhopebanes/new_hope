class Document < ActiveRecord::Base
  attr_accessible :description, :document_type_id, :name, :document_link
  belongs_to :document_type
  has_attached_file :document_link,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates :name, :presence => true
  validates :document_link, :presence => true

  def doc_type
  	DocumentType.find(document_type_id).title
  end
end
