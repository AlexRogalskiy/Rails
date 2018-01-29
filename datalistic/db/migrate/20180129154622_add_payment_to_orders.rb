class AddPaymentToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :payment, foreign_key: true, index: true
  end
end
