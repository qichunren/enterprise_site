# coding: utf-8
class Syspanel::NavmenusController < Syspanel::BaseController
  # GET /navmenus
  def index
    @navmenus = Navmenu.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /navmenus/new
  def new
    @navmenu = Navmenu.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /navmenus/1/edit
  def edit
    @navmenu = Navmenu.find(params[:id])
  end

  # POST /navmenus
  def create
    @navmenu = Navmenu.new(params[:navmenu])

    respond_to do |format|
      if @navmenu.save
        format.html { redirect_to(syspanel_navmenus_path, :notice => 'Navmenu was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /navmenus/1
  def update
    @navmenu = Navmenu.find(params[:id])

    respond_to do |format|
      if @navmenu.update_attributes(params[:navmenu])
        format.html { redirect_to(syspanel_navmenus_path, :notice => 'Navmenu was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /navmenus/1
  def destroy
    @navmenu = Navmenu.find(params[:id])
    @navmenu.destroy

    respond_to do |format|
      format.html { redirect_to(syspanel_navmenus_path) }
    end
  end
end
