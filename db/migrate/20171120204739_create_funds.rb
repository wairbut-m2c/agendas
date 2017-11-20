class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :entity_name
      t.string :year
      t.string :ammount
      t.references :organization, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
