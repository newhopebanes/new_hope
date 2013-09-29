class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
