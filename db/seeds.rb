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
MySettings.company_full_name     = "上海企业建站公司"
MySettings.company_short_name    = "上海建站"
MySettings.company_introduce     = "上海企业建站公司是某某某 ... 此处省略一万字."
MySettings.company_address       = "上海市徐汇区某某路88888号（火星大厦）888楼"
MySettings.enable_product_module = true
MySettings.company_telphone      = "021-88888888"
MySettings.enable_product_module = true
MySettings.latest_product_size   = 8             
# all site setting end

Product.create(:name => "ThinkPad E40（0579-A12）14英寸笔记本电脑（i3-380M 2G 320G7200转 512M独显 摄",
               :product_no => "405491",
               :price => 3599,
               :category_id => category_22.id, # 笔记本
               :avatar => File.new(Rails.root.join("db/seeds_data/6f83c9d8-f1c3-47df-b29d-925bc98266f9.jpg")),
               :description => "ThinkPad® Edge 思迥异，做不同。锐意进取，优美流畅，摒弃浮华，洗却铅华，仅以清晰线条和大胆色彩彰显ThinkPad卓越性能。")
               
Product.create(:name => "苹果（Apple） MacBook Pro MC700CH/A 13.3寸宽屏笔记本",
              :product_no => "359578",
              :price => 8269,
              :category_id => category_22.id, # 笔记本
              :avatar => File.new(Rails.root.join("db/seeds_data/0f1ebf2a-9817-47d6-bf62-3c0c80909061.jpg")),
              :description => %!
<span class="Apple-style-span" style="color:#333333;font-family:宋体, Arial, Lucida, Verdana, Helvetica, sans-serif;"><div style="margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0px;padding-top:7px;padding-right:15px;padding-bottom:7px;padding-left:15px;font-weight:bold;font-size:14px;line-height:1.5em;font-family:Arial, Helvetica, sans-serif;">新一代四核和双核 Intel 处理器</div>
<div style="margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0px;padding-top:7px;padding-right:15px;padding-bottom:7px;padding-left:15px;font-size:14px;line-height:1.5em;font-family:Arial, Helvetica, sans-serif;">13 英寸 MacBook Pro 现配备 2.3GHz Intel Core i5 处理器或现有的最快速双核处理器：2.7GHz Intel Core i7。这些处理器的 Turbo Boost 睿频速度高达 3.4GHz，使 13 英寸 MacBook Pro 的运行速度可达到上代产品的 2 倍。</div>
<div style="margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0px;padding-top:7px;padding-right:15px;padding-bottom:7px;padding-left:15px;font-size:14px;line-height:1.5em;font-family:Arial, Helvetica, sans-serif;">但仅有速度还不能令我们满足。全新 15 英寸和 17 英寸机型将四核动力赋予你所做的几乎每一件事。现有的 2.3GHz 四核 Intel Core i7 处理器拥有高达 3.4GHz 的 Turbo Boost 睿频速度和高达 8MB 的 3 级共享缓存，使得这些 MacBook Pro 机型的应用程序在运行速度上快达上一代同系列高端产品的 2 倍。</div>
</span>
!)

Product.create(:name => "神舟（HASEE）优雅UL30-C17D1 13.3英寸笔记本电脑（743 1G 160G 无线 摄",
               :product_no => "286865",
               :price => 1999,
               :category_id => category_22.id, # 笔记本
               :avatar => File.new(Rails.root.join("db/seeds_data/72720098-3feb-40b2-93f3-1b5365468719.jpg")),
               :description => "优雅UL30-C17采用无卡扣贝壳式设计，外观整体风格简约而大气，兼容专业质感与人文气息，加上利落的线条搭配圆角设计，强调理性与感性两种方式与态度的充分磨合，符合人体工学原理的同时也令开关屏幕更轻松随意。整体以黑色为主色调，将沉稳的元素渗透到设计中，给人一种硬朗的感觉。")
               
Product.create(:name => "爱仕达乐家系列不锈钢七件套铲具SSQ-07C",
              :product_no => "212150",
              :price => 86,
              :category_id => category_12.id, # 厨卫电器
              :avatar => File.new(Rails.root.join("db/seeds_data/60593ecd-2b4c-4b2b-86b5-070b6ac4afea.jpg")),
              :description => "精选不锈钢材料、光亮持久、经久耐用人性化设计手柄、隔热防烫、手感舒适。
              铲、勺、捞 全套组合、为你的厨房添加更多的色彩。
              以“制造厨房健康产品，提升人类生活品质”为企业使命，致力做绿色厨房的倡导者。爱仕达炊具制造能力居世界前列，产品国内市场占有率名列前茅，产品畅销世界50个国家和地区，出口额居国内同行业首位。")
              
Product.create(:name => "振能28cm不锈钢盆",
              :product_no => "143784",
              :price => 16,
              :category_id => category_12.id, # 厨卫电器
              :avatar => File.new(Rails.root.join("db/seeds_data/2a926f02-f3f6-4f16-9c2f-fb8ff992c93b.jpg")),
              :description => "创建于1987年，厂区座落于中国不锈钢制品之乡——彩塘，是粤东地区专业生产不锈钢日用及厨餐具制品的龙头企业。
                  在二十多年的发展历程中，本厂始终秉承“开拓、实干、创新、诚信”的经营宗旨，坚持“市场为先导,人才为支撑，和谐为根本，服务为引擎”的企业发展理念。拥有“振能”和“豪威”商标，在ISO9001:2000国际质量管理体系和ISO14001:2004国际环境管理体系的多重严格监督下，研制开发产品80多个系列1000余个品种中，有20多项获得国家专利，其中不锈钢电器产品已通过国家强制性CCC认证。产品以其齐全的规格、精湛的工艺、新颖的造型、优良的质量、合理的价格和完善的售后服务赢得广大消费者的信赖和赞誉，畅销全国各地及东南亚和欧美等地。")
                  
Product.create(:name => "摩托罗拉（Motorola）Atrix ME860 3G手机（黑色）WCDMA\GSM 非定制机",
              :product_no => "375479",
              :price => 4798,
              :category_id => category_23.id, # 手机
              :avatar => File.new(Rails.root.join("db/seeds_data/57b4811f-7a49-4a6a-8eaa-9922a5c15208.jpg")),
              :description => "摩托罗拉的的智能手机设计自成一体，总体来说就是内敛、低调。整个正面没有设计一个物理按键，下方的四大标准按键也是内置其中。正面采用的是4.0吋屏幕，分辨率达到qHD（960x540）级别。这个分辨率的屏幕可以充分保证屏幕的清晰度。
              作为商务手机典范，Atrix 整机虽然采用的是塑料材质，不过在质感方面做得非常舒适。外面的柔性材质可以与手掌非常好的契合。117.75x63.5x10.95mm的三围将这款手机的外观衬托的非常霸道，而整机的重量却只有135g。")
              
Product.create(:name => "空间大师三塑胶门格柜BZ42118SDCH",
               :product_no => "312535",
               :price => 139,
               :category_id => category_32.id, # 家具
               :avatar => File.new(Rails.root.join("db/seeds_data/23e9389c-91bd-46bf-a297-c8f7e00f1903.jpg")),
               :description => "白色柜体，粉红色、黄色、蓝色塑胶门，PB板，三聚氰胺贴皮，MBS塑胶门，商品美观大方，无毒无味，环保。
               商品尺寸42*29*118CM
               PB板双贴三聚氰胺（39.6*29*1.2CM） 
               侧板：PB板双贴三聚氰胺（60*29*1.2CM） 
               固定层板：PB板双贴三聚氰胺（39.6*27.4*1.2CM）
               背板：MDF双贴华丽纸（58.3*20.7*0.3CM）ABS料塑胶门
               承重量：30kg
               公司在拓展国外市场的同时，积极地吸取、积累其成功的经验，大力开拓国内市场。2005年公司全力推广国内市场并注册了“空间大师”品牌，秉呈优质、物廉、周到的服务，公司与国内经销商及各名知连锁商超展开非常快速的合作公司现有销售网点已达850个以上，为做好销售服务，公司投入重金在全国建立了22个办事处及8个物流中转仓库，并获得“中国DIY家具市场用户满意第一品牌”。")
                              
Product.create(:name => "空间大师三抽A4收纳柜SJJ012",
              :product_no => "408711",
              :price => 118,
              :category_id => category_32.id, # 家具
              :avatar => File.new(Rails.root.join("db/seeds_data/17d79cab-bf00-41dd-a083-d9a5ae58c170.jpg")),
              :description => "空间大师三抽A4收纳柜SJJ012

              商品尺寸26*34*23CM，
              包装尺寸51*35*70.3CM")
                            
Product.create(:name => "宅e族防辐射款多功能笔记本电脑桌（天蓝）",
              :product_no => "276284",
              :price => 89,
              :category_id => category_32.id, # 家具
              :avatar => File.new(Rails.root.join("db/seeds_data/796a5905-8702-4bf7-89c3-1cd1d3dbe975.jpg")),
              :description => "材质：塑料 金属    净尺寸：64*38*45  净重量：2.7")
              
Product.create(:name => "空间大师简易电脑桌DN-006",
              :product_no => "186673",
              :price => 89,
              :category_id => category_32.id, # 家具
              :avatar => File.new(Rails.root.join("db/seeds_data/01a019cc-dfde-4899-a208-afcbd825d81e.jpg")),
              :description => "空间大师简易电脑桌DN-006
              主要参数
              1、尺寸：60*48*75cm；
              2、重量：10.5kg；
              3、材质：白橡PVC、碳钢银色烤漆。
              商品简介
              产品安装简单、实用性强
              木纹色")

Product.create(:name => "佳能（Canon） PowerShot A2200 数码相机（蓝色）",
              :product_no => "355829",
              :price => 999,
              :category_id => category_11.id, # 影视设备
              :avatar => File.new(Rails.root.join("db/seeds_data/13fea821-da9f-4dac-9e5a-d264e01d7c2f.jpg")),
              :description => "PowerShot A2200/A1200搭载了28mm广角，可以将更多美景收入镜头之中，配合4倍光学变焦，即便是视线远方的景物，也能轻松捕捉，清晰拍摄，满足用户的日常拍摄需求，获得令人满意的影像。")
              
Product.create(:name => "飞利浦（Philips）202E1SB 20英寸宽屏液晶显示器",
              :product_no => "185239",
              :price => 739,
              :category_id => category_11.id, # 影视设备
              :avatar => File.new(Rails.root.join("db/seeds_data/8cecbeb4-9b9f-44d2-ad8c-1e03e1ea49e8.jpg")),
              :description => "享受这款支持 Vista 的高清显示屏带来的更多乐趣！ 202E1 具有 DVI 和 VGA 输入、自动格式调整功能、 SmartContrast 技术和抛光表面，是满足各种需求的绝佳选择")