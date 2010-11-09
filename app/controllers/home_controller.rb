class HomeController < ApplicationController
  def index
    @latest_notices = Notice.published.limit 5  
    @latest_products = Product.published.limit 10
  end

end
