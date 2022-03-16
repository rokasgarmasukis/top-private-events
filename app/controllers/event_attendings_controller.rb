class EventAttendingsController < ApplicationController

  def create
    @event_attending = helpers.current_user.event_attendings.build(attended_event_id: params[:id])
    @event_attending.save
    redirect_to root_path
  end

  def destroy
    event_attending = EventAttending.find_by(attended_event_id: params[:id])
    event_attending.destroy
    redirect_to root_path, notice: "Opted out"
  end


end
