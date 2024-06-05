# frozen_string_literal: true

class PrizeService < ApplicationService
  attr_reader :reward, :user, :profile

  Result = Struct.new(:success?, :error)

  def initialize(reward_id)
    @reward = Reward.find(reward_id)
    @user = reward.user
    @profile = user.profile
  end

  def call
    Profile.transaction do
      user.transactions.create!(activity: :spend, transactable: reward, points: reward.points)
      profile.update!(points: profile.points - reward.points)
      reward.destroy! unless reward.repeatable?
    end

    Result.new(true, nil)
  rescue StandardError => e
    Result.new(false, e.message)
  end
end
