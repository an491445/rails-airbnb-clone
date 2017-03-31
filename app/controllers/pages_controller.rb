class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @banner_photo = "pexels-minivan_hspdl5.jpg"
    @minivans = Minivan.all

    @departures = Minivan.return_departures_with_coordinates

    @hash = Gmaps4rails.build_markers(@departures) do |departure, marker|
      marker.lat departure.latitude
      marker.lng departure.longitude
    end
  end
end
