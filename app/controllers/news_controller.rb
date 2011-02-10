# encoding: utf-8
class NewsController < ApplicationController

  # GET /news
  def index
    @news = News.order("id DESC").paginate :page => params[:page], :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /news/1
  def show
    @news = News.find(params[:id])
    if cookies["news_#{@news.id}_read".to_sym].blank?  
      @news.click_count = @news.click_count + 1
      @news.save                                                                     
      # TODO cookie应该设为一个小时内有效
      cookies["news_#{@news.id}_read".to_sym] = "read"                                
    end

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
