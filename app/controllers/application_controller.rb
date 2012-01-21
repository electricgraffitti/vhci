# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :current_student_session, :current_student, :box_video, :ipad, :super?, :current_employee_session, :current_employee, :employee_admin?, :super_user?
  
  private
  
  def current_employee_session
    return @current_employee_session if defined?(@current_employee_session)
    @current_employee_session = EmployeeSession.find
  end

  def current_employee
    return @current_employee if defined?(@current_employee)
    @current_employee = current_employee_session && current_employee_session.record
  end
  
  def require_employee
    unless current_employee
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_employee_session_url
      return false
    end
  end

  def require_no_employee
    if current_employee
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
  
  def current_student_session
    return @current_student_session if defined?(@current_student_session)
    @current_student_session = StudentSession.find
  end

  def current_student
    return @current_student if defined?(@current_student)
    @current_student = current_student_session && current_student_session.record
  end
  
  def require_student
    unless current_student
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_student_session_url
      return false
    end
  end

  def require_no_student
    if current_student
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def box_video(box_type)
    case box_type
      when "green_video"
        green_video
      when "red_video"
        red_video
      when "blue_video"
        blue_video
      when "yellow_video"
        yellow_video
      when "nhcaa"
        nhcaa_launch_video
      else
        main_video
    end
  end
  
  def main_video
    if ipad
      video = "/banner_videos/nucleus_teaser_ipad.mp4"
    else
      video = "/banner_videos/nucleus_teaser.f4v"
    end
  end
  
  def nhcaa_launch_video
    if ipad
      video = "/banner_videos/nucleus_launch_ipad.mp4"
    else
      video = "/banner_videos/nucleus_launch.f4v"
    end
  end
  
  def red_video
    if ipad
      video = "/banner_videos/nucleus_1_ipad.mp4"
    else
      video = "/banner_videos/nucleus_1.f4v"
    end
  end
  
  def blue_video
    if ipad
      video = "/banner_videos/nucleus_2_ipad.mp4"
    else
      video = "/banner_videos/nucleus_2.f4v"
    end
  end
  
  def yellow_video
    if ipad
      video = "/banner_videos/nucleus_3_ipad.mp4"
    else
      video = "/banner_videos/nucleus_3.f4v"
    end
  end
  
  def green_video
    if ipad
      video = "/banner_videos/nucleus_4_ipad.mp4"
    else
      video = "/banner_videos/nucleus_4.f4v"
    end
  end
  
  def ipad
    request.user_agent =~ /iPad/i || request.user_agent =~ /iPhone/i
    # request.user_agent =~ /(Mobile\/.+Safari)/      
  end
  
  protected
  
  def employee_admin?
    current_employee.role.role_type == 'super_user' || current_employee.role.role_type == 'admin'
  end
  
  def super_user?
    current_employee.role.role_type == 'super_user'
  end
  
  def auth_super
    unless super?
      flash[:error] = "You are not the super!"
      redirect_to home_path
      false
    end
  end
  
  def super?
    authenticate_or_request_with_http_basic do |username, password|
      username == APP['username'] && password == APP['password']
    end
  end

end
