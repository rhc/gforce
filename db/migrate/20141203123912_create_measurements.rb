class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.references :attendance, index: true
      t.references :measure, index: true
      t.float :score

      t.timestamps
    end
    add_index :measurements, [:attendance_id, :measure_id], unique: true
  end
end
