class AddAddressIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :address_id, :string
  end
end
