# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :transactable

  validates :name, presence: true, length: { in: 3..100 }
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :repeatable, inclusion: { in: [true, false] }
end
