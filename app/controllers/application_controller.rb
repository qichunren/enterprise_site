# coding: utf-8 
class ApplicationController < ActionController::Base

  protect_from_forgery

  # store the current url path
  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end


  def rescue_action_in_public(exception)
    case exception.class.to_s
    when "ActionController::RoutingError"
      render :template => 'error/resource_not_exsit' and return
    when "ActiveRecord::StatementInvalid"
      logger.info "#{Time.now.to_s(:db)} apperror: #{exception.inspect}, #{exception.application_backtrace}, params:#{params.inspect}"
      render :text => "你的输入不正确! 请再试一次." and return
    when "OCIError"
      logger.info "#{Time.now.to_s(:db)} appdberror: #{exception.inspect}, #{exception.application_backtrace}, params:#{params.inspect}"
      render :text => "数据库没有连接上! 请再试一次."  and return
    else
      logger.info "#{Time.now.to_s(:db)} apperror: #{exception.inspect}, #{exception.application_backtrace}, params:#{params.inspect}"
      render :text => "#{exception.class}"  and return
    end
  end

end
