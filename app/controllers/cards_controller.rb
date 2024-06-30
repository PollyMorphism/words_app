# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[edit update destroy]

  def index
    @cards = current_user.cards
  end

  def new
    @deck = Deck.find(params[:deck_id]) if params[:deck_id]
    @card = current_user.cards.build
  end

  def edit; end

  def create
    @card = current_user.cards.build(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_back fallback_location: cards_url, notice: t("cards.create") }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to params[:previous_request] || cards_path, notice: t("cards.update") }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card.destroy!

    respond_to do |format|
      format.html { redirect_back fallback_location: cards_path, notice: t("cards.delete") }
      format.json { head :no_content }
    end
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:front, :back, :deck_id)
  end
end
