class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
    @user = current_user
    @minivans = @user.minivans
    @bookings = @user.bookings
    @bookings_other = Booking.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    @profile.update(profile_params)

    if @profile.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name,
      :driver_license, :title, :biography)
  end

end
