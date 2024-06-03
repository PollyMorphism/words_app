# frozen_string_literal: true

json.array! @rewards, partial: "rewards/reward", as: :reward
