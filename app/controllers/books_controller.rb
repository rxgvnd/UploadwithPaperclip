class BooksController < ApplicationController
    before_action :set_book, only: [:show, :destroy]
  
    def index
      @books = Book.order('created_at DESC')
    end
  
    def new
      @book = Book.new
    end
  
    def show
    end
  
    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to books_path
      else
        render :new
      end
    end
  
    def destroy
      @book.destroy
      respond_to do |format|
        format.html { redirect_to books_url, notice: "Drop was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
  
    def book_params
      params.require(:book).permit(:title, :description, :image)
    end
  
    def set_book
      @book = Book.find(params[:id])
    end
  end