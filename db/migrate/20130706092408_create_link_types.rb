class CreateLinkTypes < ActiveRecord::Migration
  def change
    create_table :link_types do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
