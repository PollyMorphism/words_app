# frozen_string_literal: true

class QuizzesController < ApplicationController
  before_action :authenticate_user!

  def show
    @card = Card.find(session[:card_ids][session[:current_card_index]])

    session[:current_card_index] += 1
  rescue ActiveRecord::RecordNotFound
    remove_quiz_session

    redirect_to deck_path(session[:deck_id]), notice: t("quiz.completed")
  end

  def create
    show_nested_cards = ActiveModel::Type::Boolean.new.cast(params[:show_nested_cards])
    @deck = Deck.find(params[:deck_id])
    set_quiz_session(@deck, show_nested_cards)

    redirect_to action: :show
  end

  def update
    card = Card.find(params[:id])
    card.review!(params[:quality].to_i)

    redirect_to action: :show
  end

  private

  def set_quiz_session(deck, show_nested_cards)
    session[:deck_id] = deck.id
    session[:card_ids] = deck.get_cards(nested_cards: show_nested_cards).ids
    session[:current_card_index] = 0
  end

  def remove_quiz_session
    session.delete(:card_ids)
    session.delete(:current_card_index)
  end
end
