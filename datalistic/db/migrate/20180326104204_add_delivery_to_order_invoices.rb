class AddPaymentToOrderInvoices < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_invoices, :delivery, foreign_key: true, index: true
  end
end
