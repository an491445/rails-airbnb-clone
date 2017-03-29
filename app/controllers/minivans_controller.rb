class MinivansController < ApplicationController
  before_action :set_user, only: [:new, :create, :destroy]
  before_action :set_minivan, only: [:show, :edit, :update, :destroy]

  def index
    @minivans = Minivan.all
  end

  def show
    #@minivan = Minivan.find(params[:id])
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
    #@minivan = Minivan.find(params[:id])
  end

  def update
    #@minivan = Minivan.find(params[:id])
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
