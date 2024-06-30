# frozen_string_literal: true

class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: %i[edit show update destroy]

  def index
    @decks = current_user.decks.roots
  end

  def show
    @cards = @deck.cards
    @decks = @deck.children
    set_path
  end

  def new
    @deck = Deck.new(parent_id: params[:parent_id])
    set_path
  end

  def edit
    set_path
  end

  def create
    @deck = current_user.decks.new(deck_params)

    respond_to do |format|
      if @deck.save
        format.html { redirect_to deck_path(@deck), notice: t("decks.create") }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to decks_url, notice: t("decks.update") }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    redirect_path = @deck.parent ? deck_path(@deck.parent) : decks_path
    @deck.destroy!

    respond_to do |format|
      format.html { redirect_to redirect_path, notice: t("decks.delete") }
      format.json { head :no_content }
    end
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def set_path
    @path = @deck.breadcrumbs
  end

  def deck_params
    params.require(:deck).permit(:name, :parent_id)
  end
end
