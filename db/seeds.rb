# encoding: utf-8 
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

# super admin
super_admin = Admin.create(
                             :login => "admin",
                             :email => "admin@admin.com",
                             :password => "admin888",
                             :password_confirmation => "admin888",
                             :dept => 0,
                             :super_admin => true )

super_admin = Admin.create(
                            :login => "davidcao",
                            :email => "whyruby@gmail.com",
                            :password => "davidcao888",
                            :password_confirmation => "davidcao888",
                            :dept => 1,
                            :super_admin => false ) 
                            
notice_1 = Notice.create(:title => "公司网站正式开通了", :body => "公司网站正式开通了, 欢迎访问, 并留下你的宝贵意见.", :created_by => super_admin.login)
notice_2 = Notice.create(:title => "好消息，公司新产品上市了", :body => "公司新产品上市了, 欢迎选购.", :created_by => super_admin.login)         

Navmenu.create!([
  {
    :label => "首页",
    :url   => "/",
    :link_title => "首页" }, 
  
  { :label => "新闻中心",
    :url => "/news",
    :link_title => "新闻中心",
    :position => 1 },
     
  { :label => "产品中心",
    :url => "/products",
    :link_title => "联系我们",
    :position => 2 },
    
  { :label => "联系我们",
    :url => "/contract-us",
    :link_title => "联系我们",
    :position => 3 }    
    ])

# All categories  start

root_category = Category.create(:name => "全站分类")

category_1 = Category.create(:name => "家用电器", :parent_id => root_category.id)
category_2 = Category.create(:name => "电脑通信", :parent_id => root_category.id)   
category_3 = Category.create(:name => "家居生活", :parent_id => root_category.id)
category_4 = Category.create(:name => "运动休闲", :parent_id => root_category.id)
category_5 = Category.create(:name => "食品饮料", :parent_id => root_category.id)
                                                                              
category_11 = Category.create(:name => "影视设备", :parent_id => category_1.id)  
category_12 = Category.create(:name => "厨卫电器", :parent_id => category_1.id) 

category_21 = Category.create(:name => "台式机", :parent_id => category_2.id)  
category_22 = Category.create(:name => "笔记本", :parent_id => category_2.id) 
category_23 = Category.create(:name => "手机", :parent_id => category_2.id)

category_31 = Category.create(:name => "室外装饰", :parent_id => category_3.id)  
category_32 = Category.create(:name => "家具", :parent_id => category_3.id)

category_41 = Category.create(:name => "滑冰", :parent_id => category_4.id)  
category_42 = Category.create(:name => "健身器材", :parent_id => category_5.id)

category_51 = Category.create(:name => "饮料", :parent_id => category_5.id)  
category_52 = Category.create(:name => "休闲食品", :parent_id => category_5.id)
# all categories end


# all site setting start
SiteSetting.create(
                     :name => "公司全名",
                     :setting_key => "company_full_name",
                     :setting_value => "上海ABC有限公司",
                     :remark => "", :build_in => true,
                     :value_type => "string" ) 

SiteSetting.create(
                     :name => "公司简称",
                     :setting_key => "company_short_name",
                     :setting_value => "上海ABC",
                     :remark => "", :build_in => true,
                     :value_type => "string" )

SiteSetting.create(
                    :name => "公司简介",
                    :setting_key => "company_introduce",
                    :setting_value => "火星市某某家居有限公司，占地面积450余亩，年产陶瓷洁具320多万件，浴缸、淋浴房、龙头、浴室柜等卫浴设施300多万套。公司现有员工4800 多人，公司传承开拓创新精神，专注于制造高品质的陶瓷洁具及配套产品，为广大用户提供自由、奔放、舒适、健康的产品。公司拥有300多名资深设计师组成的设计团队，在产品设计上充分以人文化、科技智能化的设计理念，全力彰显人性需求，同时结合人体工程学、流体力学、结构力学的最新研究成果，开发研制出 2200多种款式新颖、时尚大方的产品。",
                    :remark => "", :build_in => true,
                    :value_type => "text" )  
                     
SiteSetting.create(
                    :name => "公司地址",
                    :setting_key => "company_address",
                    :setting_value => "上海市徐汇区漕溪北路18号（上实大厦）37楼",
                    :remark => "", :build_in => true,
                    :value_type => "string" )

SiteSetting.create(
                    :name => "公司联系电话",
                    :setting_key => "company_telphone",
                    :setting_value => "021-885566",
                    :remark => "", :build_in => true,
                    :value_type => "string" )
SiteSetting.create(
                     :name => "是否启用产品模块",
                     :setting_key => "enable_product_module",
                     :setting_value => "true",
                     :remark => "", :build_in => true,
                     :value_type => "boolean" )
                     
SiteSetting.create(
                    :name => "最新商品显示条目",
                    :setting_key => "latest_product_size",
                    :setting_value => "8",
                    :remark => "", :build_in => true,
                    :module => "product",
                    :value_type => "integer" )                  
# all site setting end