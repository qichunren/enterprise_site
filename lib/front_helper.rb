# encoding: utf-8
module FrontHelper 
  
  
  # 取得公司公德
  #TODO 加更多方法选项，如order
  def get_notices(limit, options={})
    Notice.published.limit limit
  end 
  
  # 取得公司产品
  #TODO 加更多方法选项，如order
  def get_products(limit, options={})
    Product.published.limit limit
  end
  
end