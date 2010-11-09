# encoding: utf-8
class Syspanel::BaseController < ApplicationController
  layout "syspanel"           
  
  #before_filter :authentication   # authentication 用户是否已登录
  before_filter :require_admin
  before_filter :set_current_admin # set current admin in model layer

  #before_filter :authorization    # authorization  用户是否有访问这个action的权限

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