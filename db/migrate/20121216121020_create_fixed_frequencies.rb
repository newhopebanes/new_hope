class CreateFixedFrequencies < ActiveRecord::Migration
  def change
    create_table :fixed_frequencies do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
