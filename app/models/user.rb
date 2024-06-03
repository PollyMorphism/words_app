# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :rewards
  has_many :transactions
  has_one :profile

  after_create :create_user_profile

  def create_user_profile
    create_profile
  end

  def recent_tasks
    tasks.where(id: transactions.get.latest.pluck(:transactable_id))
  end

  def recent_rewards
    rewards.where(id: transactions.spend.latest.pluck(:transactable_id))
  end
end
