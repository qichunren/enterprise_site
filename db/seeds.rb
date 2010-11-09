# encoding: utf-8

super_admin = Admin.create!(
                             :login => "admin",
                             :email => "admin@admin.com",
                             :password => "admin888",
                             :password_confirmation => "admin888",
                             :dept => 0,
                             :super_admin => true
                             
                             )
