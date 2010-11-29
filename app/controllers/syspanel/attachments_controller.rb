# coding: utf-8
class Syspanel::AttachmentsController <  Syspanel::BaseController
  # GET /attachments
  def index
    @attachments = Attachment.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /attachments/1
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new

    respond_to do |format|
      format.html {
        if params[:layout] == "false"
          render :layout => false
        end
      }
    end
  end

  # GET /attachments/1/edit
  def edit
    @attachment = Attachment.find(params[:id])
  end

  # POST /attachments
  def create
    @attachment = Attachment.new(params[:attachment])

    respond_to do |format|
      if @attachment.save
        format.html { render :text => "ddd" }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /attachments/1
  def update
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to([:syspanel, @attachment], :notice => 'Attachment was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /attachments/1
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to(syspanel_attachments_url) }
    end
  end
end
