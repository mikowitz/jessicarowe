ActiveAdmin.register Event do
  permit_params :date, :time, :title, :notes, :address_1, :address_2, :city_state_zip,
    :rsvp, :contact, :address
end
