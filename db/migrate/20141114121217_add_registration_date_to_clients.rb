class AddRegistrationDateToClients < ActiveRecord::Migration
  def change
    add_column :clients, :registered_on, :date
  end
end
