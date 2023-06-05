class UserController < ApplicationController
  before_action :authenticate_user!

  def show
    @created_events = current_user.created_events
    @attended_events = current_user.attended_events
  end
end
