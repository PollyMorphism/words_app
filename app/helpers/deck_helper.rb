# frozen_string_literal: true

module ApplicationHelper
  def cards_count(deck, show_nested_cards: true)
    deck.get_cards(nested_cards: show_nested_cards).count
  end

  def review_count(deck, show_nested_cards: true)
    deck.get_cards(nested_cards: show_nested_cards).for_review.count
  end
end
