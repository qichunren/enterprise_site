# 介绍?

这是一个用Rails3写的公司企业网站，可以用于普通的公司网站.

![Preview](https://github.com/qichunren/enterprise_site/raw/master/themes/default/cover.png)

### 功能

- 新闻
- 产品展示
- 客户留言
- 自定义页面
- 多主题

### 怎么起步？

<pre>
    git clone git://github.com/qichunren/enterprise_site.git
    cd enterprise_site
    bundle install
    修改数据库配置文件config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed
    rails s thin
</pre>
现在可以访问 http://localhost:3000 看到效果了，后台地址是 http://localhost:3000/admin_login ，默认的管理员帐号和密码是admin/admin888


### 进度

目前还在开发中，我正在完善多主题这一块。


### License

欢迎自由使用。告诉我一下就可以了。
