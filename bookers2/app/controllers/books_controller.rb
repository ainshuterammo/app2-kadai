class BooksController < ApplicationController
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
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to  new_book_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully updated."
    else
      if @post.update(post_params)
        redirect_to book_path
      else
        render :edit
      end
    end
  end
  def destroy

    @books = Book.all
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to  book_path
      flash[:notice] = "Book was successfully destroyed."
    else
      @post.destroy
    end
  end
    # @book = Book.find(current_user.id)
    # @book = book.destroy(user.id)
    # @book.destroy
    # redirect_to books_path
    # flash[:notice] = "Book was successfully destroyed."




  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
