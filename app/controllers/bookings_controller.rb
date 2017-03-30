class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :edit, :update]

  def create
    @booking = Booking.new(booking_params)
    @minivan = Minivan.find(params[:minivan_id])
    @user = current_user

    @booking.minivan = @minivan
    @booking.user = @user
    @booking.status = "Not confirmed"

    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to minivan_path(@minivan)
    end
  end

  def show
    @minivan = @booking.minivan
    @minivans = [@minivan]
    @user = @booking.user
    @driver = @minivan.user
    @traveller = @booking.user

    if current_user != @traveller && current_user != @driver
      redirect_to root_path
    end
  end

  def edit
    @minivan = @booking.minivan
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to profile_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:message)
  end
end
