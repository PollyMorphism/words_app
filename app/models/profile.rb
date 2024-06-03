# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :money, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
