class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :compare_at_price, precision: 10, scale: 2
      t.string :category, null: false
      t.string :gender, null: false, default: "all"
      t.string :sizes, array: true, default: [], null: false

      t.timestamps
    end
  end
end
