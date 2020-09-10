class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book edited."
      redirect_to books_path
    else
      render 'edit'
    end
  end
  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to books_path
  end
  def create
    @book = Book.new(book_params)
     if @book.save
        flash[:success] = "New Book created."
        redirect_to books_path
      else
        render 'new'
      end
  end
  private
  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end
end
