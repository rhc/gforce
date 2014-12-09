class AddIndexOnClientForPayments < ActiveRecord::Migration
  def change
    add_index :payments, :client_id
  end
end
