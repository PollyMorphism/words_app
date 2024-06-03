# frozen_string_literal: true

class Transaction < ApplicationRecord
  enum :activity, [:get, :spend]

  belongs_to :user
  belongs_to :transactable, polymorphic: true

  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :latest, -> { order(created_at: :desc).limit(5) }
end
