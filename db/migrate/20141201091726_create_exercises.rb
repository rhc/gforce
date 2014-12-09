class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :video

      t.timestamps
    end
    add_index :exercises, :name, unique: true
  end
end
