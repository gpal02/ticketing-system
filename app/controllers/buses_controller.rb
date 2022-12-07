class BusesController < ApplicationController
    load_and_authorize_resource, except = [:index, :new]

  def index
    @q = Bus.ransack(params[:q])
    @buses = @q.result(distinct: true).paginate( page: params[:page], per_page: 6)
    # if params[:query].present?
    #   @buses = Bus.where("destination || source || bus_number || date LIKE ?", "%#{params[:query]}%")
    # else
    #   @buses = Bus.all
    # end
    # @buses = @buses.paginate( page: params[:page], per_page: 10)
  end

  def show
    @bus = Bus.find(params[:id])
    @seats = @bus.seats
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      # @seats = 60.times{  @bus.seats.create(bus_seats: "A1")}
      flash[:success] = "Your Bus Added Successfully!"
      redirect_to buses_path
    else
      render 'buses/new'
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
      render 'buses/edit', status: :unprocessable_entity
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
    params.require(:bus).permit(:bus_number, :manager_id, :bus_type, :source, :destination, :date, :time)
  end

  

end
