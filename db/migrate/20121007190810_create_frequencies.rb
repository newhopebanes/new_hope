class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
