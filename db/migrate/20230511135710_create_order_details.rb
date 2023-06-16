class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

# カラム一覧
      t.integer :amount, null: false
      t.integer :order_price, null: false
      t.integer :crafting_status, null: false, default: 0
      t.integer :item_id, null: false
      t.integer :order_id, null: false

      t.timestamps
    end
  end
end
