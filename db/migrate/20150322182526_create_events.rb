class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :time
      t.string :title
      t.text :notes
      t.text :address
      t.string :rsvp
      t.string :contact
      t.timestamps
    end
  end
end
