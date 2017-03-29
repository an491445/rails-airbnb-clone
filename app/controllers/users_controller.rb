class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @minivans = @user.minivans
    @bookings = @user.bookings
  end
end
