class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :quantity
      t.string :type

      t.timestamps
    end
    add_index :medicines, :name, unique: true
    add_index :medicines, :quantity, unique: true
    add_index :medicines, :type, unique: true
  end
end
