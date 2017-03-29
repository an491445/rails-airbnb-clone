class MinivansController < ApplicationController
  before_action :set_user, only: [:new, :create, :destroy]
  before_action :set_minivan, only: [:show, :edit, :update, :destroy]

  def index
    @minivans = Minivan.all
  @minivans = Minivan.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@minivans) do |minivan, marker|
      marker.lat minivan.latitude
      marker.lng minivan.longitude
      # marker.infowindow render_to_string(partial: "/minivans/map_box", locals: { flat: flat })
    end
  end

  def show
    @same_user = current_user == @minivan.user
    @booking = Booking.new
  end

  def new
    @minivan = Minivan.new
  end

  def create
    @minivan = Minivan.new(minivans_params)
    @minivan.user= @user
    if @minivan.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @minivan.update(minivans_params)
  end

  def destroy
    @minivan.destroy
    redirect_to user_path(@user)
  end

private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_minivan
    @minivan = Minivan.find(params[:id])
  end

  def minivans_params
    params.require(:minivan).permit(:capacity, :model_year, :gearbox, :price_per_day, :location, :description, :picture, :photo_cache)
  end
end
