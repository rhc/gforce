require 'csv'

namespace :db do
  desc "Create an invoice for each client"
  task invoice_all: :environment do
    Client.all.each(&:invoice!)
  end
end
