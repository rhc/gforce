class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :email
      t.string :gender
      t.string :photo

      t.timestamps
    end
  end
end
