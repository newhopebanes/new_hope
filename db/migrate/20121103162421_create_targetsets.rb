class CreateTargetsets < ActiveRecord::Migration
  def change
    create_table :targetsets do |t|
      
      t.integer :event_id
      t.boolean :adults
      t.boolean :under_18
      t.boolean :men
      t.boolean :women
      t.boolean :mental_health
      t.boolean :learning_difficulties
      t.boolean :drug_alcohol
      t.boolean :homelessness
      t.boolean :carers
      t.boolean :carers_mental_health
      t.boolean :vulnerable
      t.boolean :anyone
      t.string  :other

      t.timestamps
    end
  end
end
