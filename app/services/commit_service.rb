# frozen_string_literal: true

class CommitService < ApplicationService
  attr_reader :task, :user, :profile

  def initialize(task_id)
    @task = Task.find(task_id)
    @user = task.user
    @profile = user.profile
  end

  def call
    Profile.transaction do
      user.transactions.create!(activity: :get, transactable: task, points: task.points)

      profile.update!(points: profile.points + task.points)
      task.destroy! unless task.repeatable?
    end
  end
end
