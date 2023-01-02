class ReviewsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @review = @ticket.reviews.create(comment_params)
    redirect_to ticket_path(@ticket)
  end

  private
  def comment_params
    params.require(:review).permit(:commenter, :comment)
  end
end
