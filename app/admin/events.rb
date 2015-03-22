ActiveAdmin.register Event do
  permit_params :date, :time, :title, :notes, :address_1, :address_2, :city_state_zip,
    :rsvp, :contact, :address

  index do
    column :date
    column :time
    column :title
    actions
  end

  show do
    attributes_table do
      row :date
      row :time
      row :title
      row :notes
      row :address do |event|
        event.decorate.address
      end
      row :rsvp do |event|
        event.decorate.rsvp(show_title: false)
      end
      row :contact do |event|
        event.decorate.contact(show_title: false)
      end
    end
  end

  form do |f|
    f.inputs "Event" do
      f.input :date, as: :date_picker
      f.input :time
      f.input :title
      f.input :notes, input_html: { rows: 10 }
      f.input :address, input_html: { rows: 4 }
      f.input :rsvp
      f.input :contact
      f.actions
    end
  end
end
