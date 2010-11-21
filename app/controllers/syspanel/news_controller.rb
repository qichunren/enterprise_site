# encoding: utf-8
class Syspanel::NewsController < Syspanel::BaseController
  
  # GET /news
  def index
    @news = News.paginate :page => params[:page], :per_page => 20

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /news/1
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /news/new
  def new
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  # POST /news
  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to([:syspanel, @news], :notice => '新闻发布成功.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /news/1
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to([:syspanel, @news], :notice => '新闻修改成功.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /news/1
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to(syspanel_news_index_url) }
    end
  end
end
