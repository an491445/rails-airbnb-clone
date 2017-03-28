class MinivansController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
    @minivans = Minivan.all
  end

  def show
    @minivan = Minivan.find(params[:id])
  end

  def new
    @minivan = Minivan.new
  end

  def create
     @minivan = Minivan.create(minivans_params)
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
  end

  def destroy
  end

private
  def set_user
    @user = User.find(params[:user_id])
  end

  def minivans_params
    params.require(:minivan).permit(:capacity, :model_year, :gear_box, :price_per_day, :location, :description, :picture, :photo_cache)
  end
end
