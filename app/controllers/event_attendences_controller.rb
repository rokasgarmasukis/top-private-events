class EventAttendencesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event_attendence = current_user.event_attendences.build(event_attendence_params)
    @event_attendence.save
  end

  def destroy
    @event_attendence = EventAttendence.find(params[:attended_event_id])
    return unless @event_attendence.event_attendee_id == current_user.id

    @event_attendence.destroy
  end

  private

  def event_attendence_params
    params.require(:event_attendence).permit(:attended_event_id, :event_attendee_id)
  end

  def unauthorized_redirect
    flash[:error] = 'You are not allowed to modify this event.'
    redirect_to root_path
  end
end
