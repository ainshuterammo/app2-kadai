class BooksController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_user, only: [:edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book1 = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to  books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to book_path(@book.id)
    else
      if @book.update(book_params)
        redirect_to book_path
        flash[:notice] = "Book was successfully updated."
      else
        render :edit
      end
    end
  end
  def destroy
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to  book_path(book.id)
    else
      @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
