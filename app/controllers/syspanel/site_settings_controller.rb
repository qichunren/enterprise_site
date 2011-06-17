# encoding: utf-8
class Syspanel::SiteSettingsController < Syspanel::BaseController
  # GET /site_settings
  def index
    @my_setting_items = MySettings.all
  end 
  
  def basic
  end   
  
  def contact_info
  end   
                                                                                   
  #TODO 优化
  def batch_update 
    if params[:site_setting].present?
      params[:site_setting].each do |key, value|
        eval "MySettings.#{key}='#{value}'"
      end
      flash[:notice] = "保存成功"
    end                          
    if params[:current_action].present?
      redirect_to :action => params[:current_action] and return
    else
      redirect_to :action => :basic and return
    end
  end

  # GET /site_settings/1
  def show
    @site_setting = SiteSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /site_settings/new
  def new
    @site_setting = SiteSetting.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /site_settings/1/edit
  def edit
    @site_setting = SiteSetting.find(params[:id])
  end

  # POST /site_settings
  def create
    @site_setting = SiteSetting.new(params[:site_setting])
    @site_setting.build_in = false # ervery new created config item is not build_in

    respond_to do |format|
      if @site_setting.save
        format.html { redirect_to(syspanel_site_settings_path, :notice => '新配置项添加成功.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /site_settings/1
  def update
    @site_setting = SiteSetting.find(params[:id])

    respond_to do |format|
      if @site_setting.update_attributes(params[:site_setting])
        format.html { redirect_to(syspanel_site_settings_path, :notice => 'Site setting was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /site_settings/1
  def destroy
    @site_setting = SiteSetting.find(params[:id])
    @site_setting.destroy

    respond_to do |format|
      format.html { redirect_to(syspanel_site_settings_path) }
    end
  end
end
