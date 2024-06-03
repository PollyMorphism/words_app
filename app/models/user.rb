# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_one :profile

  after_create :create_user_profile

  def create_user_profile
    create_profile
  end
end
