class LksController < ApplicationController
  def index
    @k = Favorites.all
    render
  end

  def show
    card_id = params[:id].to_i
    
  end
end
