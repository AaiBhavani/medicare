class Medicine < ApplicationRecord
    monetize :mrp_paise, :pur_paise
end
