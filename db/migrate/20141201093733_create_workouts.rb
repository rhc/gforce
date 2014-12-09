class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.references :unit, index: true
      t.text :description

      t.timestamps
    end
    add_index :workouts, :name, unique: true
  end
end
