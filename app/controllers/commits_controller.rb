# frozen_string_literal: true

class CommitsController < ApplicationController
  before_action :authenticate_user!

  def create
    CommitService.call(params[:id])

    redirect_to tasks_path, notice: "Task has been completed!"
  end
end
