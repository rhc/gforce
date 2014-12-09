class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.date :paid_on
      t.references :client

      t.timestamps
    end
  end
end
