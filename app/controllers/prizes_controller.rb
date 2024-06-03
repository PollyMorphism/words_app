# frozen_string_literal: true

class PrizesController < ApplicationController
  before_action :authenticate_user!

  def create
    PrizeService.call(params[:id])

    redirect_back fallback_location: rewards_path, notice: t("rewards.get")
  rescue ActiveRecord::RecordInvalid
    redirect_back fallback_location: rewards_path, alert: t("rewards.no_points")
  end
end
