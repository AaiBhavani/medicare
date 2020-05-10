class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :medicine, null: false, foreign_key: true
      t.integer :unit, default: 1
      t.monetize :price_each, currency: { present: false }
      t.monetize :price, currency: { present: false }
      t.integer :status, null: false, default: 0
      t.integer :delivery_mode, null: false, default: 0

      t.timestamps
    end
  end
end
