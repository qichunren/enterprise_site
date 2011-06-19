# coding: utf-8
class Syspanel::ProductsController < Syspanel::BaseController 
  
  # GET /products
  def index
    @search = Product.order("id DESC").search(params[:search])
    @products = @search.page(params[:page]).per(30)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /products/new
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  def create
    @product = Product.new(params[:product]) 
    @product.created_by = current_admin.login

    respond_to do |format|
      if @product.save
        format.html { redirect_to([:syspanel, @product], :notice => 'Product was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /products/1
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to([:syspanel, @product], :notice => 'Product was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /products/1
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(syspanel_products_url) }
    end
  end
  
  # GET /syspanel/products/settings
  def settings
  end
  
  # POST /syspanel/products/update_settings
  def update_settings
    MySettings.enable_product_module = params[:site_setting][:enable_product_module] == "true" ? true : false
    redirect_to :action => :settings
  end
end