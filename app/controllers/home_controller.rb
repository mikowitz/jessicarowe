class HomeController < ApplicationController
  def schedule
    @events = Event.upcoming.decorate
  end
end
