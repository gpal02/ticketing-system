class Bus < ApplicationRecord

  has_many :tickets
  belongs_to :user, foreign_key: :manager_id 
  paginates_per 10

  after_initialize :init

  private

  def init
    if alloted_seats <= 0
      self.alloted_seats = 0
    end
    puts self.time
    # p self.time
    # time = self.time
    #   puts time
     # = self.time.strftime('%H:%M:%S')
  end
end
