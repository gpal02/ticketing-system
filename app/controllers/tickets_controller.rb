class TicketsController < ApplicationController
  # load_and_authorize_resource, except = [:index, :new_login , :new]

  def index
    @tickets = current_user.tickets.all
    @bus = Bus.all
  end

  def show
    @ticket = current_user.tickets.find(params[:id])
    @information = Ticket.find(params[:id]).passenger_informations
  end

  def new
    @ticket = current_user.tickets.new(bus_id: params[:bus_id])
    @ticket.passenger_informations.new
    # @bus=current_user.tickets.find(params[:id]).bus
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      TicketMailer.with(ticket: @ticket).successfull_mail(@ticket.id).deliver_now
      redirect_to @ticket
      flash[:success] = "Booked Successfully"
    else
      render 'tickets/show', status: :unprocessable_entity
    end
  end

  def edit
    @ticket = current_user.tickets.find(params[:id])
  end

  def update
    @ticket = current_user.tickets.find(params[:id])

    if @ticket.update(ticket_params)
      redirect_to tickets_path
      flash[:success] = "Updated Successfully"
    else
      render 'tickets/edit', status: :unprocessable_entity
    end
  end

  def destroy
    @ticket = current_user.tickets.find(params[:id])
    passenger_count = @ticket.passenger_informations.count
    bus = @ticket.bus
    bus.update(alloted_seats: bus.alloted_seats - passenger_count)
    @ticket.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def ticket_params
    params.require(:ticket).permit(:price ,:number_of_passenger,:seat,:user_id,:bus_id, passenger_informations_attributes: [:id,:seat, :passenger_name, :passenger_age,:passenger_contact, :_destroy])
  end

end
