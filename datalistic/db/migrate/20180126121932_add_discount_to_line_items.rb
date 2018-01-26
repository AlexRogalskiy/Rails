class AddDiscountToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :discount, :decimal, precision: 8, scale: 2, default: "1.00"
  end
end
