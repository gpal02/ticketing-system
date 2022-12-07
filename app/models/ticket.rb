class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  has_many :passenger_informations
  accepts_nested_attributes_for :passenger_informations, allow_destroy: true
  after_create :seat_allocated

  def seat_allocated 
  
    return puts "There is no seat available" if bus.alloted_seats == bus.total_seats
    
    seats = ['0','1','2','3','4']
    all_seats = []

    ('A'..'O').each do |i|
      (1..seats.length-1).each do |j|
        all_seats.push(i+seats[j])
      end
    end
    
    alloted_seats = self.bus.tickets.map {|t| t.passenger_informations.pluck(:seat)}.flatten.compact 
    passenger_informations.each do |passenger|
      passenger.seat = get_seat(all_seats, alloted_seats)
      passenger.save
      alloted_seats.push(passenger.seat)
      bus.alloted_seats += 1
      bus.save
    end
  
  end

  def get_seat(seats, assigned)
    available_seat = seats.sample
    while assigned.include?(available_seat)
      available_seat = seats.sample
    end
    return available_seat
   end
end

