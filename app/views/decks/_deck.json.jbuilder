# frozen_string_literal: true

json.extract! deck, :id, :name
json.url deck_url(deck, format: :json)
