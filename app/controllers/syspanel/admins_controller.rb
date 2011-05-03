# coding: utf-8
class Syspanel::AdminsController < Syspanel::BaseController
   
   def index   
     @search = Admin.search(params[:search])
     @admins = @search.relation.page(1).per_page(30)
   end
end