class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_restaurant, only: [:edit, :update, :show]

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
    if @review.update(review_params)
      redirect_to restaurant_review_path(@restaurant, @review)
    else
      render :edit
    end
  end

  def destroy
    restaurant = @review.restaurant
    @review.destroy
    redirect_to restaurant_path(restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
