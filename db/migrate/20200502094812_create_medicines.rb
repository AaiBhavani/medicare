class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :product, default: nil
      t.string :company, default: nil
      t.string :code, default: nil
      t.string :packing, default: nil
      t.integer :unit, default: 1
      t.decimal :sgst, default: 6.00, precision: 4, scale: 2, null: false
      t.decimal :cgst, default: 6.00, precision: 4, scale: 2, null: false
      t.decimal :igst, default: 0.00, precision: 4, scale: 2, null: false
      t.decimal :rate_margin, default: 0.00, precision: 4, scale: 2, null: false
      t.decimal :fixed_disc, default: 0.00, precision: 4, scale: 2, null: false
      t.string :category, default: nil
      t.monetize :mrp, currency: { present: false }
      t.monetize :pur, currency: { present: false }

      t.timestamps
    end
    add_index :medicines, :name, unique: true
  end
end
