class User < ApplicationRecord
  enum role: [:retailer, :distributor]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :retailer
  end
end
