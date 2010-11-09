# encoding: utf-8
class AdminSessionsController < ApplicationController

  skip_before_filter :require_admin, :only => [:new, :show, :create]
  layout false
  
  def new
    @admin_session = AdminSession.new
  end

  def show
    redirect_to :action => :new
  end

  def create
    @admin_session = AdminSession.new(params[:admin_session])
    if @admin_session.save
      flash[:notice] = "登录成功!"
      redirect_to "/syspanel/home/index"
    else
      flash[:warning] = "你输入的帐号或密码不正确!"
      render :action => :new
    end
  end

  def destroy
    current_admin_session.destroy
    flash[:notice] = "你已安全退出系统!"
    redirect_back_or_default new_admin_session_url
  end

end
