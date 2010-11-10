# encoding: utf-8
class Syspanel::SiteSettingsController < Syspanel::BaseController
  # GET /site_settings
  # GET /site_settings.xml
  def index
    @site_settings = SiteSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @site_settings }
    end
  end

  # GET /site_settings/1
  # GET /site_settings/1.xml
  def show
    @site_setting = SiteSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site_setting }
    end
  end

  # GET /site_settings/new
  # GET /site_settings/new.xml
  def new
    @site_setting = SiteSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site_setting }
    end
  end

  # GET /site_settings/1/edit
  def edit
    @site_setting = SiteSetting.find(params[:id])
  end

  # POST /site_settings
  # POST /site_settings.xml
  def create
    @site_setting = SiteSetting.new(params[:site_setting])

    respond_to do |format|
      if @site_setting.save
        format.html { redirect_to(@site_setting, :notice => 'Site setting was successfully created.') }
        format.xml  { render :xml => @site_setting, :status => :created, :location => @site_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /site_settings/1
  # PUT /site_settings/1.xml
  def update
    @site_setting = SiteSetting.find(params[:id])

    respond_to do |format|
      if @site_setting.update_attributes(params[:site_setting])
        format.html { redirect_to(@site_setting, :notice => 'Site setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /site_settings/1
  # DELETE /site_settings/1.xml
  def destroy
    @site_setting = SiteSetting.find(params[:id])
    @site_setting.destroy

    respond_to do |format|
      format.html { redirect_to(site_settings_url) }
      format.xml  { head :ok }
    end
  end
end
