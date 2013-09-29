class CreateTagsets < ActiveRecord::Migration
  def change
    create_table :tagsets do |t|
      t.integer :event_id
      t.boolean :arts
      t.boolean :sports
      t.boolean :outdoors
      t.boolean :creative
      t.boolean :wellbeing
      t.boolean :social
      t.boolean :faith
      t.boolean :food
      t.boolean :learning
      t.boolean :exercise
      t.boolean :lifestyle
      t.string  :other 

      t.timestamps
    end
  end
end
