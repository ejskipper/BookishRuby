class CopiesController < ApplicationController
  before_action :get_book
  before_action :set_copy, only: [:show, :edit, :update, :destroy]
  def index
    @copies = @book.copies
  end

  def new
    @copy = @book.copies.build
    render "./books/copies/new"
  end

  def show
  end

  def edit
    @copy = Copy.find(params[:id])
    render "books/copies/edit"
  end

  def create
    @copy = @book.copies.build(copy_params)
      if @copy.save
        redirect_to book_path(@book)
      else
        redirect_to new_book_copy_path(@book)
      end
  end

  def update
    if @copy.update(copy_params)
      redirect_to book_path(@book)
    else
      redirect_to edit_book_copy_path(@book,@copy)
    end
  end

  def destroy
    @copy.destroy
    redirect_to book_path(@book)
  end

  private

  def get_book
    @book = Book.find(params[:book_id])
  end

  def set_copy
    @copy = @book.copies.find(params[:id])
  end

  def copy_params
    params.require(:copy).permit(:book_id, :due_date, :user_id)
  end
end
