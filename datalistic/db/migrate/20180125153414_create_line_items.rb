class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.references :product, foreign_key: true, index: true, null: false
      t.belongs_to :cart, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
