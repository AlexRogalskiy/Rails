class AddLimitToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :limit, :integer, default: 0
  end
end
