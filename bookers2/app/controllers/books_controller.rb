class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.(book_params)
  end

  def destroy
    @book = book.destroy(user.id)
    @book.destroy
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end



end
