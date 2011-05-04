# coding: utf-8 
class ApplicationController < ActionController::Base

  protect_from_forgery        
  
  theme :theme_resolver
  
  # store the current url path
  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end       
  
  def render_404
    render_optional_error_file(404)
  end

  def render_optional_error_file(status_code)
    status = status_code.to_s
    if ["404", "422", "500"].include?(status)
      render :template => "/errors/#{status}.html.erb", :status => status, :layout => "application"
    else
      render :template => "/errors/unknown.html.erb", :status => status, :layout => "application"
    end
  end
  
  helper_method :current_admin_session, :current_admin

  private   
  
  def theme_resolver
    # current_user.theme # or anything else that return a string. 
    "default"
  end

  def current_admin_session
    return @current_admin_session if defined?(@current_admin_session)
    @current_admin_session = AdminSession.find
  end

  # get the current logged admin worker.
  def current_admin
    return @current_admin if defined?(@current_admin)
    @current_admin = current_admin_session && current_admin_session.record
  end

  # before fileter for reuqire a logged admin worker.
  def require_admin
    unless current_admin
      store_location
      flash[:error] = "你还没有登录，请先登录！"
      redirect_to new_admin_session_url
      return false
    end
  end
  
  # this will set current admin into Admin model
  def set_current_admin
    Admin.current = current_admin
  end

  # proxy for acts_as_audit gem
  def current_user
    current_admin
  end

end