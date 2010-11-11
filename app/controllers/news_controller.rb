class NewsController < ApplicationController

  # GET /news
  def index
    @news = News.paginate :page => params[:page], :per_page => 10

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

end
