# coding: utf-8
class Syspanel::ProductConfigrationsController < Syspanel::BaseController
 
 
  def index
    @product_configrations = SiteSetting.find_all_by_module(:product)
  end
  
  
  def edit
    @product_configration = SiteSetting.product_module.find params[:id]
  end
  
  def update
    @product_configration = SiteSetting.product_module.find params[:id]
    
    if @product_configration.update_attributes(params[:site_setting])
      flash[:notice] = "参数修改成功"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
end