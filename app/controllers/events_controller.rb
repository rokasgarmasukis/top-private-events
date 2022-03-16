class EventsController < ApplicationController
  before_action :require_login, except: :index

  def index
    @events = Event.all
    if helpers.logged_in?
      @user_attended_events = helpers.current_user.attended_events.select(:id).all
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = helpers.current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path, notice: "Event created successfully"
    else
      flash.now[:alert] = "Please check input"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    puts params[:id]
    @event = Event.find_by(id: params[:id])
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])

    if @event.update(event_params)
      redirect_to event_path, notice: "Event updated successfully"
    else
      flash.now[:alert] = "Please check input"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    redirect_to root_path, notice: "Event deleted"
  end

  private

  def require_login
    unless session[:user_id].present?
      redirect_to root_path, alert: "Please sign in first"
    end
  end

  def event_params
    params.require(:event).permit(:title, :content, :datetime)
  end
end
