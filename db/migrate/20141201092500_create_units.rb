class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :acronym
      t.string :description

      t.timestamps
    end
    add_index :units, :acronym, unique: true
  end
end
