class EventAttendingsController < ApplicationController

  def create
    @event_attending = helpers.current_user.event_attendings.build(attended_event_id: params[:id])
    @event_attending.save
    redirect_to root_path
  end



end
