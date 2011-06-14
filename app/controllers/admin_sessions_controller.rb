# encoding: utf-8
class AdminSessionsController < ApplicationController

  skip_before_filter :require_admin, :except => [:destroy]
  
  layout false

  def new
    @admin_session = AdminSession.new
  end

  def show
    redirect_to :action => :new
  end

  def create
    # params[:admin_session][:login]
    login_hash = {}
    login_hash[:login] = params[:admin_session][:login].strip if params[:admin_session]
    login_hash[:password] = params[:admin_session][:password] if params[:admin_session]
    @admin_session = AdminSession.new(login_hash)
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
    redirect_back_or_default admin_login_url
  end

end
