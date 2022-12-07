class Seat < ApplicationRecord
  belongs_to :bus
  
  validate :seat_booked


  # after_commit :exceed_seats 

  private
  def seat_booked
    
  end


  # def exceed_seats
  #   Seat.last.destroy if Seat.count > 60
  # end
  

end
