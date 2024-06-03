# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @profile = current_user.profile
    @tasks = current_user.recent_tasks
    @rewards = current_user.recent_rewards
  end
end
