class AddDiscountToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :discount, :decimal, precision: 8, scale: 2, default: "1.00"
  end
end
