# frozen_string_literal: true

class Deck < ApplicationRecord
  has_closure_tree

  belongs_to :user
  has_many :cards, dependent: :destroy

  validates :name, presence: true, length: { in: 3..100 }

  def breadcrumbs
    ancestors.reverse
  end
end
