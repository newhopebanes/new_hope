class AddAddressIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :address_id, :string
  end
end
