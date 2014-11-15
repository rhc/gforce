class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.date :starts_on
      t.date :expires_on
      t.float :amount

      t.timestamps
    end
  end
end
