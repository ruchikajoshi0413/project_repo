module Api
  module V1

    class BooksController < ApplicationController

      def index
        @books = Book.all
        render json: @books
      end
    
      # GET /books/1 or /books/1.json
      def show
        render json: Book.find(book_params)
      end
      
      def new
        
        render json: Book.new

      end
      def create

        @book = Book.new(book_params)
      
        if @book.save
      
          render json: @book, status: :created
      
        else
      
          render json: @book.errors, status: :unprocessable_entity
      
        end
      end
      def update

        @book = Book.find(params[:id])
      
        if@book.update(book_params)
      
          head :no_content
      
        else
      
          render json:@book.errors, status: :unprocessable_entity
      
          end
      
      end 
      def destroy

        @book = Book.find(params[:id])
      
        if@book.destroy
      
          head :no_content
      
        else
      
          render json:@book.errors, status: :unprocessable_entity
      
        end
      end
      private
      def book_params

        params.permit(:title, :body)

      end
          
          
    end

  end
end