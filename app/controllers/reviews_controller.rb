class ReviewsController < ApplicationController
  http_basic_authenticate_with name: "jac", password: "secret", only: :destroy

  def create
    @review = Review.create!(review_params.merge(user: current_user))
    redirect_to review_path(@review)
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # @review = @restaurant.reviews.create(review_params)
    # redirect_to restaurant_path(@restaurant)
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
    params.require(:review).permit(:reviewer, :body, :rating)
  end
end
