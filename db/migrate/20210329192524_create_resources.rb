class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.references :survivor, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
