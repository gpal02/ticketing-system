class Ticket < ApplicationRecord
  # belongs_to :user
  # belongs_to :bus
  has_many :passenger_informations
  accepts_nested_attributes_for :passenger_informations, allow_destroy: true
end
