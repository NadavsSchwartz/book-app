module BooksHelper
  def display_title(book)
    book.title.downcase
  end
end
