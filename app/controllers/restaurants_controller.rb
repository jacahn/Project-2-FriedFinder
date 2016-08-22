class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :create, :destroy, :new]
  # i don't think you want both basic authenticate and authenticate_user!
  http_basic_authenticate_with name: "jac", password: "secret", except: [:index, :show]

  def index

    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to @restaurant
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :url)
    end


end
