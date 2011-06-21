# coding: utf-8 
class ApplicationController < ActionController::Base

  protect_from_forgery        
  
  theme :theme_resolver
  def theme_resolver
    MySettings.current_theme || "default"
  end
  
  before_filter :set_locale
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  rescue_from ActionView::MissingTemplate, :with => :view_not_found
  def view_not_found
    error_404_file = Rails.root.join("themes/#{theme_resolver}/views/errors/404.html")
    if File.exist?(error_404_file)
      render :file => error_404_file, :status => 404, :layout => false and return
    else
      render :text => I18n.t("controller.application.page_not_found"), :status => 404 and return
    end
  end
  
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
      redirect_to admin_login_url
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