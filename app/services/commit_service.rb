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
      profile.update!(points: profile.points + task.points)
      task.destroy! unless task.repeatable?
    end

    result_description
  end

  private

  def result_description
    "#{task.points} #{(task.points > 1) ? 'points' : 'point'}"
  end
end
