# frozen_string_literal: true

class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reward, only: %i[edit update destroy]

  def index
    @rewards = current_user.rewards
  end

  def new
    @reward = Reward.new
  end

  def edit; end

  def create
    @reward = current_user.rewards.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to rewards_url, notice: t("rewards.create") }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to rewards_url, notice: t("rewards.update") }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reward.destroy!

    respond_to do |format|
      format.html { redirect_to rewards_url, notice: t("rewards.delete") }
      format.json { head :no_content }
    end
  end

  private

  def set_reward
    @reward = Reward.find(params[:id])
  end

  def reward_params
    params.require(:reward).permit(:name, :points, :repeatable)
  end
end
