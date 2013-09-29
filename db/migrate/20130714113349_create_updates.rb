class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :description
      t.string :area
      t.string :action
      t.string :user

      t.timestamps
    end
  end
end
