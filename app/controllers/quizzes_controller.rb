# frozen_string_literal: true

class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz

  def show
    @card = @quiz.current_card
  rescue ActiveRecord::RecordNotFound
    deck_id = @quiz.remove_quiz_session

    redirect_to deck_path(deck_id), notice: t("quiz.completed")
  end

  def create
    show_nested_cards = ActiveModel::Type::Boolean.new.cast(params[:show_nested_cards])
    @deck = Deck.find(params[:deck_id])
    @quiz.create_quiz_session(@deck, show_nested_cards)

    redirect_to action: :show
  end

  def update
    card = Card.find(params[:id])
    card.review!(params[:quality].to_i)
    @quiz.set_next_card

    redirect_to action: :show
  end

  private

  def set_quiz
    @quiz = QuizService.new(session)
  end
end
