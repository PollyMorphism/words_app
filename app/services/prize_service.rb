# frozen_string_literal: true

class PrizeService < ApplicationService
  attr_reader :reward, :user, :profile

  def initialize(reward_id)
    @reward = Reward.find(reward_id)
    @user = reward.user
    @profile = user.profile
  end

  def call
    Profile.transaction do
      profile.update!(points: profile.points - reward.points)
      reward.destroy! unless reward.repeatable?
    end
  end
end
