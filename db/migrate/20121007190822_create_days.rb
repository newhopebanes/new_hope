class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
