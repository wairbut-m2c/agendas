class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :entity_name
      t.string :name
      t.references :organization, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
