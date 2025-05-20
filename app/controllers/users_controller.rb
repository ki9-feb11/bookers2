class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
  end

  def edit
  end

  def upadate
  end

end
