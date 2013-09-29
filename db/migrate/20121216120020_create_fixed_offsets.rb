class CreateFixedOffsets < ActiveRecord::Migration
  def change
    create_table :fixed_offsets do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
