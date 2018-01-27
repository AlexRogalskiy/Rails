class AddOrderToOrderLineItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_line_items, :order, foreign_key: true
  end
end
