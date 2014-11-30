class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :training_session, index: true
      t.references :client, index: true

      t.timestamps
    end
  end
end
