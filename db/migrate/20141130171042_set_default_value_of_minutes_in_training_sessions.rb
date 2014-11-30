class SetDefaultValueOfMinutesInTrainingSessions < ActiveRecord::Migration
  def change
    change_column_default :training_sessions, :minutes, 60
  end
end
