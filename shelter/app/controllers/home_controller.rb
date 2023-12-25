class HomeController < ApplicationController
  def index
    @k = Card.all
    render
  end

  def add_to_favorites
    img_url_to_add = params[:img_url]
    card_to_add = Card.find_by(img_url: img_url_to_add)

    @favorites = Favorites.new(img_url: card_to_add.img_url, description: card_to_add.description)
    if @favorites.save
      render json: @favorites, status: :created
    else
      render json: @favorites.errors, status: :unprocessable_entity
    end
  end

  def delete
    card_id = params[:id].to_i
    @card = Card.find_by(id: card_id)
    @card.destroy
    @favorites = Favorites.find_by(id: card_id)
    @favorites.destroy
  end
end
