# encoding: utf-8

super_admin = Admin.create(
                             :login => "admin",
                             :email => "admin@admin.com",
                             :password => "admin888",
                             :password_confirmation => "admin888",
                             :dept => 0,
                             :super_admin => true )    

SiteSetting.create(
                     :name => "公司全名",
                     :setting_key => "company_full_name",
                     :setting_value => "上海某某科技有限公司",
                     :remark => "",
                     :value_type => "string" ) 

SiteSetting.create(
                     :name => "公司简称",
                     :setting_key => "company_short_name",
                     :setting_value => "上海某某",
                     :remark => "",
                     :value_type => "string" )  
                     
SiteSetting.create(
                    :name => "公司地址",
                    :setting_key => "company_address",
                    :setting_value => "上海市徐汇区漕溪北路18号（上实大厦）37楼",
                    :remark => "",
                    :value_type => "string" )

SiteSetting.create(
                    :name => "公司联系电话",
                    :setting_key => "company_telphone",
                    :setting_value => "021-885566",
                    :remark => "",
                    :value_type => "string" )                   
