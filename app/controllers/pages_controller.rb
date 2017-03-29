class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @banner_photo = "pexels-minivan_hspdl5.jpg"
    @minivans = Minivan.all
  end
end
