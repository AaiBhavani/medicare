class Medicine < ApplicationRecord
    monetize :mrp_paise, :pur_paise
    has_many :order_details
end
