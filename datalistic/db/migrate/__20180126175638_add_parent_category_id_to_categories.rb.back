class AddParentCategoryIdToCategories < ActiveRecord::Migration[5.1]
  def change
    #add_column :categories, :parent_category_id, :integer, index: true, null: true
    add_reference :categories, :category, foreign_key: true, index: true, null: true
    #add_reference :categories, :category, foreign_key: { to_table: :categories }, null: true
    #add_index :question_votes, [:question_id, :user_id], :unique => true
    #add_column :categories, :parent_category_id, :integer, index: true, null: true
    #add_foreign_key :categories, :products, column: :parent_category_id, index: true, null: true
  end
end
