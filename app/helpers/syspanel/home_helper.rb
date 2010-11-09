# encoding: utf-8
module Syspanel::HomeHelper
  #TODO use rails I18N api to implatement it.
  def show_welcome_info_at_top_right
    "#{say_hello}，欢迎#{current_admin.login}，今天是#{l Date.current, :format => :long }"
  end  
  
  #TODO use rails I18N api to implatement it.
  def say_hello
    h = Time.now.hour
    if h >= 0 && h < 12
      "早上好"
    elsif h == 12
      "中午好"
    elsif h > 12 && h <= 18
      "下午好"
    elsif h >= 19 && h <= 23
      "晚上好"
    end
  end
  
  # get current function module name by controller name space.
  # if a controller is not in an namespace,this will get self-controller name as function module.
  def app_module
    params[:controller].split('/').first
  end
  
end
