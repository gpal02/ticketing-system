class SeatsController < ApplicationController
  def index
    @seats = Seat.all
  end
  
  def new
    @seat = Seat.new
  end
  
  def create
    @seat = Seat.new(seat_params)
    if @seat.save
      redirect_to bus_path
    else
      render new, status: :unprocessable_entity
    end
  end

  def seat_params
    params.permit(:seat).require(:bus_id)
  end

end
