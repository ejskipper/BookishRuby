class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def create
    @book = Book.new(book_params)
     if @book.save
        flash[:success] = "New Book created."
        redirect_to '/books/index'
      else
        render 'new'
      end
  end
  private
  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end
end
