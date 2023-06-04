class UserController < ApplicationController
  
  def show
    @events = current_user.created_events
  end
end
