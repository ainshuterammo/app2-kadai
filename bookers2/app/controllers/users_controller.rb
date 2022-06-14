class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user=User.find_by(id: params[:id])
  end

  def index
  end

    def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end


end
