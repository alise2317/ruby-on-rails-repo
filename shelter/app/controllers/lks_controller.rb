class LksController < ApplicationController
  def index
    @k = Favorites.all
    render
  end

  def delete
    card_id = params[:id].to_i
    @favorites = Favorites.find_by(id: card_id)
    @favorites.destroy
  end
end
