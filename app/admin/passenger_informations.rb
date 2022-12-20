ActiveAdmin.register PassengerInformation do

  menu parent: "Tickets"
  # menu parent: ["Ticket", "Bus"]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :passenger_name, :passenger_age, :passenger_contact, :seat, :ticket_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:passenger_name, :passenger_age, :passenger_contact, :seat, :ticket_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
