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
      t.integer :referral_id# , :null => false
      t.string :joining_process
      
      t.boolean :adults
      t.boolean :under_18
      t.boolean :target_men
      t.boolean :target_women
      t.boolean :target_mental_health
      t.boolean :target_learning_difficulties
      t.boolean :target_drug_alcohol
      t.boolean :target_homelessness
      t.boolean :target_carers
      t.boolean :target_carers_mental_health
      t.boolean :target_vulnerable
      t.boolean :target_anyone
      t.string  :target_other
      
      t.boolean :tag_arts
      t.boolean :tag_sports
      t.boolean :tag_outdoors
      t.boolean :tag_creative
      t.boolean :tag_wellbeing
      t.boolean :tag_social
      t.boolean :tag_faith
      t.boolean :tag_food
      t.boolean :tag_learning
      t.boolean :tag_exersise
      t.boolean :tag_lifestyle
      t.string  :tag_other
      
      t.string :directions_car
      t.string :directions_walking
      t.string :directions_bus
      t.string :directions_train
      
      t.string :other

      t.timestamps
    end
  end
end