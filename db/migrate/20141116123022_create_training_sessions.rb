class CreateTrainingSessions < ActiveRecord::Migration
  def change
    create_table :training_sessions do |t|
      t.date :starts_on
      t.datetime :starts_at
      t.string :location
      t.integer :minutes

      t.timestamps
    end
  end
end
