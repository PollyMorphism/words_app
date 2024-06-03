# frozen_string_literal: true

class CommitsController < ApplicationController
  before_action :authenticate_user!

  def create
    result = CommitService.call(params[:id])

    redirect_to tasks_path, notice: t("tasks.commit")
  end
end
