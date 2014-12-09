class CreatePlannedWorkouts < ActiveRecord::Migration
  def change
    create_table :planned_workouts do |t|
      t.references :workout, index: true
      t.references :training_session, index: true

      t.timestamps
    end
  end
end
