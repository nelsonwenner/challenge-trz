class CreateSurvivors < ActiveRecord::Migration[6.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.boolean :infected, default: false
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
