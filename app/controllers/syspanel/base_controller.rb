# encoding: utf-8
class Syspanel::BaseController < ApplicationController
  layout "syspanel"           
  
  #before_filter :authentication   # authentication 用户是否已登录
  before_filter :require_admin
  before_filter :set_current_admin # set current admin in model layer

  #before_filter :authorization    # authorization  用户是否有访问这个action的权限

  
  
end