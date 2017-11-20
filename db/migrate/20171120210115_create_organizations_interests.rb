class CreateOrganizationsInterests < ActiveRecord::Migration
  def change
    create_table :organizations_interests do |t|
      t.references :organization, index: true, foreign_key: true
      t.references :interest, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
