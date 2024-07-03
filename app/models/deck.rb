# frozen_string_literal: true

class Deck < ApplicationRecord
  has_closure_tree

  belongs_to :user
  has_many :cards, dependent: :destroy

  validates :name, presence: true, length: { in: 3..100 }
  validates_with AncestryValidator, unless: -> { parent_id.blank? }

  def breadcrumbs
    parent&.self_and_ancestors&.reverse
  end

  def get_cards(nested_cards: false)
    if nested_cards
      Card.where(deck_id: self_and_descendant_ids)
    else
      cards
    end
  end
end
