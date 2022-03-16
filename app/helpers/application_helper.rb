module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def format_time(time)
    time.in_time_zone(Time.current.zone)
  end

  def logged_in?
    current_user.present?
  end

  
end
