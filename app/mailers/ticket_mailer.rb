class TicketMailer < ApplicationMailer
	default from: "travels@busticketingsystem.com"

	def successfull_mail(id)
		@ticket = Ticket.find(id)
		@passenger = Ticket.find(id).passenger_informations.count
		@url =  'http://localhost:3000'

		mail(to: @ticket.id, subject: "Successfully Booked Ticket")
		
	end
end