class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
  end

  def show
    @profile = @user.profile
    @minivans = @user.minivans
    @bookings = @user.bookings
  end

  def edit
    @profile = @user.profile
  end

  def update
    @profile = @user.profile
    @profile.update(profile_params)
    if @profile.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name,
      :driver_license, :title, :biography)
  end

end
