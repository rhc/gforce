class AddUniqueIndexOnAttendance < ActiveRecord::Migration
  def change
    add_index :attendances, [:training_session_id, :client_id], unique: true
  end
end
