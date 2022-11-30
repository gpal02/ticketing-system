class BusesController < ApplicationController
  load_and_authorize_resource
  def index
    if params[:query].present?
      @buses = Bus.where("destination || source || bus_number || date LIKE ?", "%#{params[:query]}%")
    else
      @buses = Bus.all
    end
  end

  def show
    @bus = Bus.find(params[:id])
  end
  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      flash[:success] = "Your Bus Added Successfully!"
      redirect_to buses_path
    else
      render new_bus_path
    end
  end
  
  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
    if @bus.update(bus_params)
      redirect_to bus_path
    else
      render edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @user = Bus.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  def search
    
  end

  private
  def bus_params
    params.require(:bus).permit(:bus_number, :bus_type, :source, :destination, :date, :time)
  end

end
