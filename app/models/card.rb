# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  belongs_to :deck

  validates :front, presence: true, length: { in: 3..255 }
  validates :back, presence: true, length: { in: 3..255 }
end
