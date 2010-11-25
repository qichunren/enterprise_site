class HomeController < ApplicationController
  
  def index
    @latest_notices = Notice.published.limit 5  
    @latest_products = Product.published.limit(SiteSetting.got(:latest_product_size).to_i)
  end 

end
