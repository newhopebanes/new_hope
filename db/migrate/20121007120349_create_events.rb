class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.string :organisation, :null => false
      t.string :description
      
      t.string :contact_person
      t.string :contact_role
      t.string :phone
      t.string :email
      t.string :address
      t.string :website
      t.integer :contact_id
      
      t.date :date
      t.time :time
      t.boolean :ongoing
      t.integer :frequency_id
      t.integer :day_id
      
      
      t.string :cost, :null => false
      t.boolean :access, :null => false
      t.string :access_details
      t.integer :referral_id, :null => false
      t.string :joining_process
      t.string :target_id, :null => false
      t.string :tag_id
      
      t.string :directions_car
      t.string :directions_walking
      t.string :directions_bus
      t.string :directions_train
      
      t.string :other

      t.timestamps
    end
  end
end