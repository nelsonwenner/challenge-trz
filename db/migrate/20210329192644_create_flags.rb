class CreateFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :flags do |t|
      t.references :flagger, null: false, foreign_key: { to_table: :survivors }
      t.references :flagged, null: false, foreign_key: { to_table: :survivors }

      t.timestamps
    end
  end
end
