class ReviewsController < ApplicationController
  http_basic_authenticate_with name: "jac", password: "secret", only: :destroy

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    redirect_to restaurant_path(@restaurant)
  end

  private
  def review_params
    params.require(:review).permit(:reviewer, :body, :rating)
  end
end
