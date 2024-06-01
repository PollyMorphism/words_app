# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { in: 3..100 }
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :repeatable, presence: true
end
