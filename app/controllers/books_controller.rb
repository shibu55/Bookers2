class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update]
  def index
    @books = Book.all
    @new_book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @new_book = Book.new
    @book_comment = BookComment.new
  end

  def create
    @user = current_user
    @books = Book.all
    @new_book = Book.new(edit_book_params)
    @new_book.user_id = current_user.id



    if @new_book.save
      redirect_to book_path(@new_book.id), notice: "successfully created"
    else
      render "index"
    end
  end

  def edit
    @user = current_user
    @book = Book.find(params[:id])
  end

  def update
    @user = current_user
    @book = Book.find(params[:id])
    if @book.update(edit_book_params)
      redirect_to book_path(@book), notice: "successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "successfully destroy"
  end

  private
  def book_params
    params.permit(:title, :body)
  end
  def edit_book_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
    @edit_user = Book.find(params[:id]).user
    redirect_to books_path unless @edit_user == current_user
  end
end