class QuizService
  attr_accessor :session

  def initialize(session)
    @session = session
  end

  def create_quiz_session(deck, show_nested_cards)
    session[:deck_id] = deck.id
    session[:card_ids] = deck.get_cards(nested_cards: show_nested_cards).ids
    session[:current_card_index] = 0
  end

  def current_card
    Card.find(session[:card_ids][session[:current_card_index]])
  end

  def set_next_card
    session[:current_card_index] += 1
  end

  def remove_quiz_session
    session.delete(:card_ids)
    session.delete(:current_card_index)
    session[:deck_id]
  end
end
