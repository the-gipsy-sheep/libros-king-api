class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]
  def index
    @books = Book.all
    render json: @books.to_json(only: %i[title description year image_url]), status: 200
  end

  def show
    if @book
      render json: @book.to_json(only: %i[title description year image_url]), status: 200
    else
      render json: { status: 404, message: 'Not Found' }, status: 404
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: 201
    else
      render json: { status: 422, message: 'Error creating book' }, status: :unprocesable_entity
    end
  end

  def update
    if @book
      if @book.update(book_params)
        render json: { status: 200, message: 'Updated correctly' }, status: 200
      else
        render json: { message: 'Error updating, please try again' }, status: :unprocesable_entity
      end
    else
      render json: { status: 404, message: 'Not Found' }, status: 404
    end
  end

  def destroy
    if @book
      @book.destroy
      render json: { message: 'Book deleted' }, status: 200
    else
      render json: { status: 404, message: 'Not Found' }, status: 404
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :year, :image_url)
  end

  def set_book
    @book = Book.find_by_id(params[:id])
  end
end
