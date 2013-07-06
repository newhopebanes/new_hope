class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.string :phone
      t.string :location
      t.string :opening
      t.string :text
      t.integer :link_type_id

      t.timestamps
    end
  end
end
