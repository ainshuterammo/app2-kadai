class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # redirect_to book_path
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.(book_params)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully updated."
    else
    render :edit
    end
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
