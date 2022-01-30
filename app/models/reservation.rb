class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  def amount_days
    self.total_days = (self.checkout_date - self.check_in_date).to_i
  end

  def amount_price
    total_price = room.price * self.guests_count.to_i * total_days

  end

end
