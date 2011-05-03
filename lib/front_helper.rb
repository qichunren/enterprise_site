# encoding: utf-8
module FrontHelper 
  
  def get_notices(limit)
    Notice.published.limit limit
  end 
  
  def get_products(limit, options={})
    Product.published.limit limit
  end
  
end