# encoding: utf-8 
class PagesController < ApplicationController                 
  add_breadcrumb "首页", :root_path

  # GET /pages/our-services
  def show
    @page = Page.published.find_by_url_slug(params[:url_slug])
    render_404 and return if @page.nil?
    
    add_breadcrumb @page.title, "/pages/#{@page.url_slug}"
  end
  
  # some builded in pages
  # GET /about-us
  def about_us
  end

end
