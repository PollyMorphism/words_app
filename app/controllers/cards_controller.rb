# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[edit update destroy]

  def index
    @cards = current_user.cards.page(params[:page])
  end

  def new
    @deck = current_user.decks.find(params[:deck_id]) if params[:deck_id]
    @card = current_user.cards.build
  end

  def edit; end

  def create
    @card = current_user.cards.build(card_params)

    if @card.save
      redirect_back fallback_location: cards_url, notice: t("cards.create")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @card.update(card_params)
      redirect_to params[:previous_request] || cards_path, notice: t("cards.update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @card.destroy!

    redirect_back fallback_location: cards_path, notice: t("cards.delete")
  end

  private

  def set_card
    @card = current_user.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:front, :back, :deck_id)
  end
end
