# frozen_string_literal: true

class SuperMemoService < ApplicationService
  attr_reader :card, :quality

  MIN_EASE_FACTOR = 1.3

  def initialize(card, quality)
    @card = card
    @quality = quality
  end

  def call
    repetitions, ease_factor, interval = calculate_new_stats

    card.update!(repetitions:, ease_factor:, interval:, review_at: DateTime.now + interval.days)
  end

  private

  def calculate_new_stats
    repetitions = card.repetitions
    ease_factor = card.ease_factor
    interval    = card.interval

    if quality >= 3
      interval = calculate_new_interval(repetitions, interval, ease_factor)
      repetitions += 1
    else
      repetitions = 0
      interval = 1
    end

    ease_factor = calculate_new_ease_factor(ease_factor, quality)
    ease_factor = MIN_EASE_FACTOR if ease_factor < MIN_EASE_FACTOR

    [repetitions, ease_factor, interval]
  end

  def calculate_new_interval(repetitions, prev_interval, ease_factor)
    case repetitions
    when 0
      1
    when 1
      3
    else
      (prev_interval * ease_factor).ceil
    end
  end

  def calculate_new_ease_factor(prev_factor, quality)
    prev_factor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02))
  end
end
