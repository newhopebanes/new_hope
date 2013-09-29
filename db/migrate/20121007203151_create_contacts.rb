class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
