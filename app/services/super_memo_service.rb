# frozen_string_literal: true

class SuperMemoService < ApplicationService
  attr_accessor :card, :quality, :repetitions, :ease_factor, :interval

  def initialize(card, quality)
    @card = card
    @quality = quality
    @repetitions = card.repetitions
    @ease_factor = card.ease_factor
    @interval = card.interval
  end

  def call
    if @quality >= 3
      @interval = case @repetitions
                  when 0
                    1
                  when 1
                    3
                  else
                    (@interval * @ease_factor).ceil
                  end

      @repetitions += 1
    else
      @repetitions = 0
      @interval = 1
    end
    @ease_factor = new_ease_factor
    @ease_factor = 1.3 if @ease_factor < 1.3

    update_card
  end

  private

  def new_ease_factor
    @ease_factor + (0.1 - (5 - @quality) * (0.08 + (5 - @quality) * 0.02))
  end

  def update_card
    review_at = DateTime.now + @interval.days
    @card.update(repetitions: @repetitions, ease_factor: @ease_factor, interval: @interval, review_at:)
  end
end
