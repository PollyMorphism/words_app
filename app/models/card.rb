# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  belongs_to :deck

  validates :front, presence: true, length: { in: 3..255 }
  validates :back, presence: true, length: { in: 3..255 }

  scope :for_review, -> { where(review_at: ..DateTime.current.end_of_day) }

  def review(rate)
    SuperMemoService.call(self, rate)
  end
end
