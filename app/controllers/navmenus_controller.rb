class NavmenusController < ApplicationController
  # GET /navmenus
  # GET /navmenus.xml
  def index
    @navmenus = Navmenu.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @navmenus }
    end
  end

  # GET /navmenus/1
  # GET /navmenus/1.xml
  def show
    @navmenu = Navmenu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @navmenu }
    end
  end

  # GET /navmenus/new
  # GET /navmenus/new.xml
  def new
    @navmenu = Navmenu.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @navmenu }
    end
  end

  # GET /navmenus/1/edit
  def edit
    @navmenu = Navmenu.find(params[:id])
  end

  # POST /navmenus
  # POST /navmenus.xml
  def create
    @navmenu = Navmenu.new(params[:navmenu])

    respond_to do |format|
      if @navmenu.save
        format.html { redirect_to(@navmenu, :notice => 'Navmenu was successfully created.') }
        format.xml  { render :xml => @navmenu, :status => :created, :location => @navmenu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @navmenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /navmenus/1
  # PUT /navmenus/1.xml
  def update
    @navmenu = Navmenu.find(params[:id])

    respond_to do |format|
      if @navmenu.update_attributes(params[:navmenu])
        format.html { redirect_to(@navmenu, :notice => 'Navmenu was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @navmenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /navmenus/1
  # DELETE /navmenus/1.xml
  def destroy
    @navmenu = Navmenu.find(params[:id])
    @navmenu.destroy

    respond_to do |format|
      format.html { redirect_to(navmenus_url) }
      format.xml  { head :ok }
    end
  end
end
