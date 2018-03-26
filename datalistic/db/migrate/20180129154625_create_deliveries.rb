class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
	  t.string :delivery_code, null: false
	  t.string :delivery_type, null: false
      t.string :delivery_status, null: false
	  t.datetime :delivery_date
	  t.text :delivery_address
	  t.text :comments
	  
      t.timestamps
    end
  end
end
