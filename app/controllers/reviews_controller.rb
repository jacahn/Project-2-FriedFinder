class ReviewsController < ApplicationController
  http_basic_authenticate_with name: "jac", password: "secret", only: :destroy
  # think you probably want the authenticate method here and remove the basic auth
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new
  end
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    if current_user
      @review.user_id = current_user.id
    else
      flash[:alert] = "You must login to create new review"
    end

    @review.save
    # redirect_to review_path(@review)
    # @review = Review.create!(review_params.merge(user: current_user))
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user == current_user
      @review.destroy
    else
      flash[:alert] = "Only the author of the review can delete"
    end
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:user, :body, :rating, :restaurant_id)
  end
end
