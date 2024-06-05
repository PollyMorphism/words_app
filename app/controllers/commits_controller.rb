# frozen_string_literal: true

class CommitsController < ApplicationController
  before_action :authenticate_user!

  def create
    result = CommitService.call(params[:id])

    if result.success?
      redirect_back fallback_location: tasks_path, notice: t("tasks.commit")
    else
      redirect_back fallback_location: tasks_path, alert: result.error
    end
  end
end
