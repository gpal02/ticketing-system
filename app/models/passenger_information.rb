class PassengerInformation < ApplicationRecord
  belongs_to :ticket
  has_many :seats
  
end