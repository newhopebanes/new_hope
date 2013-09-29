class CreateDynamicOffsets < ActiveRecord::Migration
  def change
    create_table :dynamic_offsets do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
