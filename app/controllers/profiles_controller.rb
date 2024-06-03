# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end
end
