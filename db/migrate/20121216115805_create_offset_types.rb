class CreateOffsetTypes < ActiveRecord::Migration
  def change
    create_table :offset_types do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
