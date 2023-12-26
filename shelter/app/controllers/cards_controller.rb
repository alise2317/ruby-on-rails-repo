class CardsController < ApplicationController
  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end
    
  end

  private

  def card_params
    params.require(:card).permit(:img_url, :description)
  end
end
