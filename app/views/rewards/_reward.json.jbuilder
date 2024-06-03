# frozen_string_literal: true

json.extract! reward, :id, :name, :user_id, :points, :repeatable, :created_at, :updated_at
json.url reward_url(reward, format: :json)
