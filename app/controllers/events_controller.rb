class EventsController < ApplicationController
  before_action :require_login, except: :index

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = session[:user_id]

    if @event.save
      redirect_to root_path, notice: "Event created successfully"
    else
      flash.now[:alert] = "Please check input"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_login
    unless session[:user_id].present?
      redirect_to root_path, alert: "Please sign in first"
    end
  end

  def event_params
    params.require(:event).permit(:title, :content)
  end
end
