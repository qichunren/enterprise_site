# encoding: utf-8 
class PagesController < ApplicationController

  # GET /pages/our-services
  def show
    @page = Page.published.find_by_url_slug(params[:url_slug])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
