# encoding: utf-8 
class PagesController < ApplicationController                 
  add_breadcrumb "首页", :root_path

  # GET /pages/our-services
  def show
    @page = Page.published.find_by_url_slug(params[:url_slug])
    add_breadcrumb @page.title, "/pages/#{@page.url_slug}"
  end

end
