class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @profile = @user.profile
    @minivans = @user.minivans
    @bookings = @user.bookings
  end
end
