class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @book_id = params[:book]
    @books = Book.all
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to @review.book, notice: "Review successfully created."
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :book_id, :content)
  end
end
