class DeleteStartsOnFromTrainingSessions < ActiveRecord::Migration
  def change
    remove_column :training_sessions, :starts_on, :date
  end
end
