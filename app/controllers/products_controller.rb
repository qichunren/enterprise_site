# encoding: utf-8 
class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.published.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
     
  # get products list from a category
  def category                       
    @category = Category.find params[:id]
    @products = @category.products.published.page(params[:page]).per(20)
  end

  # GET /products/1
  def show
    @product = Product.published.find(params[:id])
    if cookies["product_#{@product.id}_view".to_sym].blank?
      @product.click_count += 1
      @product.save   
      cookies["product_#{@product.id}_view".to_sym] = "view"
    end

    respond_to do |format|
      format.html # show.html.erb
    end
  end

 
end
