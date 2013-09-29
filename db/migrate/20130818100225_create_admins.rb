class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :NewHopeEmail
      t.string :BridgesEmail


      t.timestamps
    end
  end
end
