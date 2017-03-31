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
      redirect_to user_minivan_booking_path(@user, @minivan, @booking)
    else
      redirect_to user_minivan_path(@minivan)
    end
  end

  def show
    @minivan = @booking.minivan
    @minivans = [@minivan]
    @user = @booking.user
    @driver = @minivan.user
    @review = Review.new

    if current_user != @user && current_user != @driver
      redirect_to root_path
    end
  end

  def edit
    @minivan = @booking.minivan
    @user = @booking.user
  end

  def update
    @minivan = @booking.minivan
    @user = @booking.user

    if current_user == @user
      @booking.update(booking_params)
    elsif current_user == @minivan.user
      @booking.update(booking_params_owner)
    end

    redirect_to user_minivan_booking_path(@user,@minivan,@booking)
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

  def booking_params_owner
    params.require(:booking).permit(:status)
  end
end
