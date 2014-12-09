class CreateSupersets < ActiveRecord::Migration
  def change
    create_table :supersets do |t|
      t.references :workout, index: true
      t.references :exercise, index: true
      t.references :unit, index: true
      t.integer :amount
      t.integer :sequence

      t.timestamps
    end
    add_index :supersets, [:workouts, :sequence], unique: true
  end
end
