class CreateComplexDates < ActiveRecord::Migration
  def change
    create_table :complex_dates do |t|
      t.string :event_id, :null => false
      t.integer :date_type_id, :null => false
      
      t.date :fixed_date
      t.time :time
      
      t.integer :offset_type_id
      
      t.integer :fixed_offset_id
      t.integer :dynamic_offset_id
      
      t.integer :frequency_id
      t.integer :fixed_frequency_id
      t.integer :day_id
      

      t.timestamps
    end
  end
end
