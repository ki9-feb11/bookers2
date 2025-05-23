class BooksController < ApplicationController

  def new
    @book = Books.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
  end

  def edit
  end

  def upadate
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
