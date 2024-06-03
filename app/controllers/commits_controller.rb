# frozen_string_literal: true

class CommitsController < ApplicationController
  before_action :authenticate_user!

  def create
    CommitService.call(params[:id])

    redirect_back fallback_location: tasks_path, notice: t("tasks.commit")
  end
end
