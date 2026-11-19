class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.page(params[:page])
    @user = Current.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = Current.user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have creaated book successfully."
    else
      @books = Book.page(params[:page])
      @user = Current.user
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(user_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
