class AddCommentsToTrainingSession < ActiveRecord::Migration
  def change
    add_column :training_sessions, :comments, :text
  end
end
