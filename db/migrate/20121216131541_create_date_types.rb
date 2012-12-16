class CreateDateTypes < ActiveRecord::Migration
  def change
    create_table :date_types do |t|
       t.string :title
       t.integer :position

      t.timestamps
    end
  end
end
