# frozen_string_literal: true

json.extract! card, :id, :front, :back
json.url card_url(card, format: :json)
