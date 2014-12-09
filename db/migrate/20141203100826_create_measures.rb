class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.string :name
      t.references :unit, index: true

      t.timestamps
    end
    add_index :measures, :name, unique: true
  end
end
