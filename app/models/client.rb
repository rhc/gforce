class Client < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  has_many :payments
  has_many :invoices
  has_many :attendances

  def full_name
    [first_name, last_name].join " "
  end

  def balance
    invoices.pluck(:amount).reduce(0, :+) - payments.pluck(:amount).reduce(0,:+)
  end

  def good_standing?
    balance >= 0
  end

  def invoice!
    puts "Invoice for #{full_name}"
    # first_invoice on the day of the registration
    # create an invoice for each day since registration using the correct tariff
    if invoices.empty?
      puts "First Invoice"
      invoices.create(amount: 150, issues_on: self.registered_on)
    end
    invoice_date = last_invoice.issues_on
    while (invoice_date += 1.month) <= Date.today
      puts "Invoice #{invoices.count}"
      invoices.create( amount: 150, issues_on: invoice_date )
    end
  end

  def to_s
    "#{full_name}"
  end

  private

  def last_invoice
    invoices.order(:issues_on).last
  end



end
