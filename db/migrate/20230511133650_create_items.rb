class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

# カラム一覧
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :is_sale, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
