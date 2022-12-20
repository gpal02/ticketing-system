ActiveAdmin.register Bus do

  menu priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :bus_number, :source, :destination, :date, :time, :bus_type, :manager_id, :total_seats, :alloted_seats
  #
  # or
  #
  # permit_params do
  #   permitted = [:bus_number, :source, :destination, :date, :time, :bus_type, :manager_id, :total_seats, :alloted_seats]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
