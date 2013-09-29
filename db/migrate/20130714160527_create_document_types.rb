class CreateDocumentTypes < ActiveRecord::Migration
  def change
    create_table :document_types do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
