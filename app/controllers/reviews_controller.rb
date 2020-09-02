class ReviewsController < ApplicationController
  def index
    @book = Book.find(params[:book_id])

    @reviews = @book.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to book_reviews_path(@review.book)
    else
      render :edit
    end
  end

  def create
    @review = current_user.reviews.build(**review_params, book_id: params[:book_id])
    if @review.save
      redirect_to redirect_to book_reviews_path(@review.book), notice: "Review successfully created."
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
