class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
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
    @book = Book.find(params[:id])
    @user = @book.user_id
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
    @book = Book.find(current_user.id)
    # @book = book.destroy(user.id)
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end



end
