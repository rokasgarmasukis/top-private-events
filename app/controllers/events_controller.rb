class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @events = Event.all.includes(:creator, :attendees)
  end

  def show
    @event = Event.includes(:attendees).find(params[:id])

    event_attendee_ids = @event.attendees.map(&:id)

    if current_user 
      @current_user_attends = event_attendee_ids.include?(current_user.id) ? true : false
    else
      @current_user_attends = nil
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
    unauthorized_redirect if @event.creator_id != current_user.id
  end

  def update
    @event = Event.find(params[:id])
    unauthorized_redirect if @event.creator_id != current_user.id

    if @event.update(event_params)
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    unauthorized_redirect if event.creator_id != current_user.id

    @event.destroy

    flash[:notice] = 'You have successfully deleted the event.'
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date_time)
  end

  def unauthorized_redirect
    flash[:error] = 'You are not allowed to modify this event.'
    redirect_to root_path
  end
end
