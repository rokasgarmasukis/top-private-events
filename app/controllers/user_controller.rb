class UserController < ApplicationController
  before_action :authenticate_user!

  def show
    @events = current_user.created_events
  end
end
