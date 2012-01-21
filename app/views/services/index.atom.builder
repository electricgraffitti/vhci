atom_feed do |feed|
    feed.title "HealthCare Insight Services"
    feed.description "Find out about HealthCare Insight"
    feed.updated(@services.first.created_at)
    
    @services.each do |s|
      feed.entry(s) do |entry|
        entry.title s.title
        entry.description(s.description, :type => 'html')
    end
  end
end