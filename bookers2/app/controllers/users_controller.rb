class UsersController < ApplicationController
  before_action :correct_user, only: [:edit,:update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # @user = User.find(current_user.id)
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user=User.find(current_user.id)
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
    # @user = User.find(params[:id])
    # @user.update(user_params)
    # redirect_to user_path(@user.id)
  end




  private

  def user_params

    params.require(:user).permit(:name, :profile_image, :Introduction)
  end

  def correct_user
   @user=User.find(params[:id])
   redirect_to user_path(current_user.id) unless @user == current_user
  end

end
