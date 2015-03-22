class HomeController < ApplicationController
  def schedule
    @events = Event.upcoming.decorate
    #@events = EventDecorator.decorate(Event.upcoming)
  end
end
