class Order < ApplicationRecord
  enum status: [:processed]
  monetize :total_paise

  belongs_to :user
  has_many :order_details, dependent: :delete_all
  
  accepts_nested_attributes_for :order_details, allow_destroy: true
  
  before_save :update_total
  after_save :recalculate_medicine_stock

  private
  def update_total
    self.total_paise = order_details.reject(&:marked_for_destruction?).map(&:price_paise).sum
  end

  def recalculate_medicine_stock
    self.order_details.select(:medicine_id, :unit).each do |o_d|
      o_d.medicine.unit = o_d.medicine.unit - o_d.unit
      o_d.medicine.save
    end
  end
end
