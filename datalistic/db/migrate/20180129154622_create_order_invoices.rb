class CreateOrderInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :order_invoices do |t|
	  t.string :invoice_code, null: false
	  t.integer :total_quantity, default: 1
	  t.integer :total_weight, precision: 20, scale: 2, default: "0.00"
      t.decimal :total_price, precision: 20, scale: 2, default: "0.00"
	  
      t.decimal :total_discount_tax_excl, precision: 20, scale: 2, default: "0.00"
	  t.decimal :total_discount_tax_incl, precision: 20, scale: 2, default: "0.00"
	  
	  t.decimal :total_paid_tax_excl, precision: 20, scale: 2, default: "0.00"
	  t.decimal :total_paid_tax_incl, precision: 20, scale: 2, default: "0.00"
	  
	  t.decimal :total_shipping_tax_excl, precision: 20, scale: 2, default: "0.00"
	  t.decimal :total_shipping_tax_incl, precision: 20, scale: 2, default: "0.00"
	  
	  t.decimal :total_wrapping_tax_excl, precision: 20, scale: 2, default: "0.00"
	  t.decimal :total_wrapping_tax_incl, precision: 20, scale: 2, default: "0.00"
	  
      t.text :comments
	  ##t.references :shipping_tax_policy_info, foreign_key: true, index: true, null: true
	  ##t.references :shipping_tax_computation_info, foreign_key: true, index: true, null: false
	  t.belongs_to :order, foreign_key: true, index: true, null: false
	  t.timestamps
    end
  end
end
