class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
