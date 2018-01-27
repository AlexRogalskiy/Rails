class CreateOrderLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_line_items do |t|
      t.integer "quantity", default: 1
      t.decimal "price", precision: 8, scale: 2, default: "0.0"
      t.decimal "discount", precision: 8, scale: 2, default: "1.0"
      t.string "coupon"
      t.references :product, foreign_key: true, index: true, null: false
      t.belongs_to :order, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
