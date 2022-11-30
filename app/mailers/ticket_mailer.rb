class TicketMailer < ApplicationMailer
	default from: "travels@busticketingsystem.com"

	def successfull_mail(id)
		@ticket = Ticket.find(id)
		@url =  'http://localhost:3000/tickets'

		mail(to: @ticket.id, subject: "Successfully Booked Ticket")
		
	end
end