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
    @deck = Deck.find(params[:deck_id])
    set_quiz_session(@deck)

    redirect_to action: :show
  end

  def update
    card = Card.find(params[:id])
    card.review!(params[:quality].to_i)

    redirect_to action: :show
  end

  private

  def set_quiz_session(deck)
    session[:deck_id] = deck.id
    session[:card_ids] = deck.cards.for_review.ids
    session[:current_card_index] = 0
  end

  def remove_quiz_session
    session.delete(:card_ids)
    session.delete(:current_card_index)
  end
end
