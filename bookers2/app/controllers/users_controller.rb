class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user=User.find_by(id: params[:id])
  end

  def index
  end

end
