class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :null => false
      t.string :description,  :null => false
      t.string :date
      t.string :time
      t.string :venue
      t.string :joining
      t.string :contact
      t.string :cost
      t.string :access
        
      
      t.timestamps
    end
  end
end