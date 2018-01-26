class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
	  t.string :title
      t.text :description
      t.integer :order, default: 0
      t.timestamps
    end
  end
end
