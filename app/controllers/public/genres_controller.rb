class Public::GenresController < ApplicationController

  def show
     @genres = Genre.all
     @genre = Genre.find(params[:id])
     @q = Item.ransack(params[:q])
  end
end
