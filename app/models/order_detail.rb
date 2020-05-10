class OrderDetail < ApplicationRecord
  monetize :price_each_paise, :price_paise
  enum delivery_mode: [:deliver_to_store, :pick_up_from_counter]

  belongs_to :order
  belongs_to :medicine

  after_validation :update_price

  private
  def update_price
    medicine_mrp = self.medicine.mrp
    self.price_each = medicine_mrp
    self.price = medicine_mrp * self.unit
  end
end
