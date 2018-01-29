class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :order_code, null: false
      # t.string :pay_type
      # t.string :pay_status
      # t.datetime :payed_at
      # t.string :pay_code
      # t.belongs_to :orders, :payment, foreign_key: true, index: true, null: false
      # t.belongs_to :orders, :client, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
