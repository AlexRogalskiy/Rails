class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :pay_type, null: false
      t.string :pay_status, null: false
      t.datetime :payed_at
      t.string :pay_code, null: false
      t.text :comments
      t.timestamps
    end
  end
end
