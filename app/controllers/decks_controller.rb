# frozen_string_literal: true

class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: %i[edit show update destroy]

  def index
    @decks = current_user.decks.roots
  end

  def show
    @cards = @deck.cards
    @cards_for_review = @cards.for_review.count
    @decks = @deck.children
    set_breadcrumbs
  end

  def new
    @deck = Deck.new(parent_id: params[:parent_id])
    set_breadcrumbs
  end

  def edit
    set_breadcrumbs
  end

  def create
    @deck = current_user.decks.new(deck_params)

    if @deck.save
      redirect_to deck_path(@deck), notice: t("decks.create")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @deck.update(deck_params)
      redirect_to redirect_path(@deck), notice: t("decks.update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @deck.destroy!

    redirect_to redirect_path(@deck), notice: t("decks.delete")
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def set_breadcrumbs
    @breadcrumbs = @deck.breadcrumbs
  end

  def redirect_path(deck)
    deck.parent ? deck_path(deck.parent) : decks_path
  end

  def deck_params
    params.require(:deck).permit(:name, :parent_id)
  end
end
