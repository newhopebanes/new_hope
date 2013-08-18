class CreateInternalContacts < ActiveRecord::Migration
  def change
    create_table :internal_contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.belongs_to :admin

      t.timestamps
    end
  end
end
