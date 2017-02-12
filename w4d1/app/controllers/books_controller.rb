class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    #render text: params
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to action: :index
  end

  def destroy
    #render json: params
    Book.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
