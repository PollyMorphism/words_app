# frozen_string_literal: true

class PrizesController < ApplicationController
  before_action :authenticate_user!

  def create
    result = PrizeService.call(params[:id])

    if result.success?
      redirect_back fallback_location: rewards_path, notice: t("rewards.get")
    else
      redirect_back fallback_location: rewards_path, alert: t("rewards.no_points")
    end
  end
end
