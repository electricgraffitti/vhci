xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do 
  xml.channel do
    xml.title "HealthCare Insight"
    xml.content "Current Health Care Fraud news feeds"
    xml.link articles_url(:rss)
    
    for article in @articlesrss
      xml.item do
        xml.title article.title
        xml.description article.description
        xml.link article_url(article.id)
      end
    end
  end
end