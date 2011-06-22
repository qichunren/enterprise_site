xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{SiteSetting.got(:company_full_name)} 新闻中心"
    xml.description "#{SiteSetting.got(:company_full_name)}最近的更新的新闻"
    xml.link news_index_url

    for news in @news
      xml.item do
        xml.title truncate(news.title, :length => 15)
        xml.description news.body
        xml.pubDate news.created_at.to_s(:rfc822)
        xml.link news_url(news)
        xml.guid news_url(news)
      end
    end
  end
end