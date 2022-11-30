class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
    @bus = Bus.all
  end
  def show
    @ticket = Ticket.find(params[:id])
  end
  def new
    @ticket = Ticket.new
  end
  def create
    # @ticket = @bus.ticket.create(ticket_params, created_at: Time.now)

    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      TicketMailer.with(ticket: @ticket).successfull_mail(@ticket.id).deliver_now
      redirect_to @ticket
    else
      render 'tickets/show', status: :unprocessable_entity
    end
  end
  def edit
    @ticket = Ticket.find(params[:id])
  end
  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      redirect_to tickets_path
    else
      render 'tickets/edit', status: :unprocessable_entity
    end
  end
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def ticket_params
    params.require(:ticket).permit(:number_of_passenger,:passenger_age,:passenger_contact,:seat,:user_id,:bus_id)
  end

end
