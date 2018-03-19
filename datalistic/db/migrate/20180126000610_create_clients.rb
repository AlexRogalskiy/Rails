class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text 	:address, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :comments
      t.timestamps
    end
  end
end
