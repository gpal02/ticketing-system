class Bus < ApplicationRecord
  has_many :tickets
  belongs_to :user, foreign_key: :manager_id 
  paginates_per 10
end
