class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book was successfully added."
    else
      flash.now[:alert] = @book.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to books_path, notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, notice: "Book was successfully deleted."
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :price, :published_date)
  end
end
