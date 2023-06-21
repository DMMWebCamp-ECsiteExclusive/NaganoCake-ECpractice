class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

# カラム一覧
      t.string :delivery_name, null: false
      t.string :delivery_post_code, null: false
      t.string :delivery_address, null: false
      t.integer :postage, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false
      t.integer :status, null: false, default: 0
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end
