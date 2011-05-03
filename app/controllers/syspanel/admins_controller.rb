# coding: utf-8
class Syspanel::AdminsController < Syspanel::BaseController
   
   def index
     @admins = Admin.page(params[:page]).per(30)
   end  
   
   def new
     @admin = Admin.new
   end                 
   
   def create
     @admin = Admin.new params[:admin]
     if @admin.save
       flash[:notice] = "#{@admin.login} 帐号创建好了"
       redirect_to syspanel_admins_path
     else
       flash.now[:error] = "有问题？"
       render :action => :new
     end
   end
   
   def edit  
     @admin = Admin.find params[:id]  
   end
   
   def update      
     @admin = Admin.find params[:id]
     if @admin.update_attributes params[:admin]
       flash[:notice] = "修改好了"
       redirect_to syspanel_admins_path
     else
       render :action => :edit
     end
   end
   
   def destroy
     if Admin.count == 1
       flash[:error] = "帐号不能全部删除"
       redirect_to syspanel_admins_path and return
     end
     
     @admin = Admin.find params[:id] 
     
     if @admin.login == "admin"
       flash[:error] = "不能删除admin帐号"
       redirect_to syspanel_admins_path and return
     end
     @admin.destroy
     flash[:notice] = "已删除"
     redirect_to syspanel_admins_path
   end
   
end