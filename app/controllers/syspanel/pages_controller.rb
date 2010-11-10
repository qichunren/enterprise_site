class Syspanel::PagesController < Syspanel::BaseController
  # GET /pages
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /pages/1
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /pages/new
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  def create
    @page = Page.new(params[:page])
    @page.created_by = current_admin.login

    respond_to do |format|
      if @page.save
        format.html { redirect_to([:syspanel, @page], :notice => 'Page was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /pages/1
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to([:syspanel, @page], :notice => 'Page was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(syspanel_pages_url) }
    end
  end
end
