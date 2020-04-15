# frozen_string_literal: true

class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :setup_data

  def index
    render json: @data
  end

  # Show a single book
  def show
    index = params[:id].to_i
    render json: @data[index]
  end

  # Create a new book
  def create
    @data << { title: params[:title], author: params[:author] }
    render json: @data
  end

  # Update a book IT'S WORKING! :)
  def update
    index = params[:id].to_i
    @data[index] = { title: params[:title], author: params[:author] }
    render json: @data[0]
  end

  # Remove a book yayyyy
  def destroy
    index = params[:id].to_i
    @data.delete_at(index)
    render json: @data[0]
  end

  private

  def setup_data
    @data = [
      { title: 'Harry Potter', author: 'J.K Rowling' },
      { title: 'Name of the wind', author: 'Patrick Rothfuss' }
    ]
  end
end
