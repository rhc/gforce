class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :issues_on
      t.float :amount
      t.references :client, index: true

      t.timestamps
    end
  end
end
