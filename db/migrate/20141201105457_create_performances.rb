class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.references :attendance, index: true
      t.references :planned_workout, index: true
      t.integer :score

      t.timestamps
    end
  end
end
