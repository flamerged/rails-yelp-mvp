class ReviewsController < ApplicationController
  def index
    @reviews =  Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    @review.restaurant_id = @restaurant.id
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destry

  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
