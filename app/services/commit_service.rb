# frozen_string_literal: true

class CommitService < ApplicationService
  attr_reader :task, :user, :profile

  Result = Struct.new(:success?, :error)

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

    Result.new(true, nil)
  rescue StandardError => e
    Result.new(false, e.message)
  end
end
