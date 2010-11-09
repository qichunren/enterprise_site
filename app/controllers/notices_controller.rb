class NoticesController < ApplicationController  
  
  # GET /notices
  def index
    @notices = Notice.published.paginate :per_page => 20, :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /notices/1
  def show
    @notice = Notice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
 
end
