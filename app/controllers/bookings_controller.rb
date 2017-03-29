class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @minivan = Minivan.find(params[:minivan_id])
    @user = current_user

    price = @minivan.price_per_day * (@booking.end_time - @booking.start_time).to_i / 1.day

    @booking.price = price
    @booking.minivan = @minivan
    @booking.user = @user
    @booking.status = "Not confirmed"

    if @booking.save
      redirect_to user_path(@user)
    else
      redirect_to minivan_path(@minivan)
    end
  end

  def index

  end

  def show
    @booking = Booking.find(params[:id])
    @minivan = @booking.minivan
    @user = current_user
    @owner = @minivan.user
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
