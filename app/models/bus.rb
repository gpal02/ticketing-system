class Bus < ApplicationRecord
  has_many :tickets
  has_many :seats
  belongs_to :user, foreign_key: :manager_id 
  # accepts_nested_attributes_for :user

end
