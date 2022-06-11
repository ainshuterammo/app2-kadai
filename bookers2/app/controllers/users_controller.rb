class UsersController < ApplicationController
  def show
    @user =　User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
end
