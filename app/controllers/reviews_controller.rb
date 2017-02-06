class ReviewsController < ApplicationController
  before_action :load_product

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to products_url, notice: "Review created succesfully"
    else
      render 'products/show'
    end
  end
  def edit
    @review = Review.find(params[:id])
  end
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to [@product, @review]
    else
      redirect_back_or_to [@product, @review]
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end
  def load_product
    @product = Product.find(params[:product_id])
  end
end
