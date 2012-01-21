xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do 
  xml.channel do
    xml.title "HealthCare Insight"
    xml.description "Find out about HealthCare Insight"
    xml.link services_url(:rss)
    
    for s in @services
      xml.item do
        xml.title s.title
        xml.description s.description
        xml.link service_url(s.id)
      end
    end
  end
end