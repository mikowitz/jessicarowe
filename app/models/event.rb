class Event < ActiveRecord::Base
  scope :upcoming, -> { where("date >= ?", Date.today).order(:date) }
end
