# encoding: utf-8
class Syspanel::SiteSettingsController < Syspanel::BaseController
  # GET /site_settings
  def index
    @site_settings = SiteSetting.all

    respond_to do |format|
      format.html # index.html.erb
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

    respond_to do |format|
      if @site_setting.save
        format.html { redirect_to(@site_setting, :notice => 'Site setting was successfully created.') }
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
        format.html { redirect_to(@site_setting, :notice => 'Site setting was successfully updated.') }
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
