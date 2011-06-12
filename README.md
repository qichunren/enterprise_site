# What's this?

This is a enterprise site application for company website.

### Feature moduels

- News
- Product
- Feedback(Guestbook)
- Customer theme

### How to get started?

<pre>
    git clone git://github.com/qichunren/enterprise_site.git
    cd enterprise_site
    bundle install
    edit config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed
    rails s thin
</pre>
visit http://localhost:3000, and default login id and password is [admin]/[admin888]


### Progress

Currently I'm developing it. I must release a workable version as soon as possible.