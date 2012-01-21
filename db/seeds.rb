# Initial Pages
Page.delete_all
Page.connection.execute('ALTER TABLE pages AUTO_INCREMENT = 0')
Page.create :page_name => "home"
Page.create :page_name => "services"
Page.create :page_name => "pci"
Page.create :page_name => "dci"
Page.create :page_name => "fci"
Page.create :page_name => "oci"
Page.create :page_name => "rxi"
Page.create :page_name => "cti"
Page.create :page_name => "benefits"
Page.create :page_name => "markets"
Page.create :page_name => "public"
Page.create :page_name => "private"
Page.create :page_name => "property"
Page.create :page_name => "resources"
Page.create :page_name => "nucleus"
Page.create :page_name => "about"
Page.create :page_name => "contact"
Page.create :page_name => "careers"
Page.create :page_name => "videos"
Page.create :page_name => "webinars"
Page.create :page_name => "articles"
Page.create :page_name => "social"
Page.create :page_name => "accreditations"
Page.create :page_name => "partners"

# Initial Doc Types
DocumentType.delete_all
DocumentType.connection.execute('ALTER TABLE document_types AUTO_INCREMENT = 0')
DocumentType.create :document_type => "PDF", :document_extension => ".pdf"
DocumentType.create :document_type => "XLS", :document_extension => ".xls"
DocumentType.create :document_type => "TXT", :document_extension => ".txt"
DocumentType.create :document_type => "DOC", :document_extension => ".doc"
DocumentType.create :document_type => "JPG", :document_extension => ".jpg"

# Initial Article Types
ArticleType.delete_all
ArticleType.connection.execute('ALTER TABLE article_types AUTO_INCREMENT = 0')
ArticleType.create :article_type => "hci_article"
ArticleType.create :article_type => "third_party"
ArticleType.create :article_type => "press_release"

# Initial Business Types
BusinessType.delete_all
BusinessType.connection.execute('ALTER TABLE business_types AUTO_INCREMENT = 0')
BusinessType.create :business_type => "Health Plan"
BusinessType.create :business_type => "Public Plan"
BusinessType.create :business_type => "Dental Plan"
BusinessType.create :business_type => "TPA"
BusinessType.create :business_type => "Taft-Hartley"
BusinessType.create :business_type => "Employer Group"

# Initial Claim Types
ClaimType.delete_all
ClaimType.connection.execute('ALTER TABLE claim_types AUTO_INCREMENT = 0')
ClaimType.create :claim_type => "Professional"
ClaimType.create :claim_type => "Facility"
ClaimType.create :claim_type => "Dental"
ClaimType.create :claim_type => "Pharmacy"
ClaimType.create :claim_type => "Oncology"
ClaimType.create :claim_type => "Vision"

# Initial Goal Types
GoalType.delete_all
GoalType.connection.execute('ALTER TABLE goal_types AUTO_INCREMENT = 0')
GoalType.create :goal_type => "Stop Fraud"
GoalType.create :goal_type => "Improve Accuracy"
GoalType.create :goal_type => "Save Money"
GoalType.create :goal_type => "Save Time"
GoalType.create :goal_type => "Ensure Compliance"
GoalType.create :goal_type => "Differentiate"

# Initial Video Types
VideoType.delete_all
VideoType.connection.execute('ALTER TABLE video_types AUTO_INCREMENT = 0')
VideoType.create :video_type => "Webinar"
VideoType.create :video_type => "Newscast"
VideoType.create :video_type => "Promotional"
VideoType.create :video_type => "Internal"

# Add States to DB
State.delete_all
State.connection.execute('ALTER TABLE states AUTO_INCREMENT = 0')
State.create :abbreviation => "AL", :full_name => "Alabama"
State.create :abbreviation => "AK", :full_name => "Alaska"
State.create :abbreviation => "AZ", :full_name => "Arizona"
State.create :abbreviation => "AR", :full_name => "Arkansas"
State.create :abbreviation => "CA", :full_name => "California"
State.create :abbreviation => "CO", :full_name => "Colorado"
State.create :abbreviation => "CT", :full_name => "Connecticut"
State.create :abbreviation => "DE", :full_name => "Delaware"
State.create :abbreviation => "DC", :full_name => "District of Columbia"
State.create :abbreviation => "FL", :full_name => "Florida"
State.create :abbreviation => "GA", :full_name => "Georgia"
State.create :abbreviation => "HI", :full_name => "Hawaii"
State.create :abbreviation => "ID", :full_name => "Idaho"
State.create :abbreviation => "IL", :full_name => "Illinois"
State.create :abbreviation => "IN", :full_name => "Indiana"
State.create :abbreviation => "IA", :full_name => "Iowa"
State.create :abbreviation => "KS", :full_name => "Kansas"
State.create :abbreviation => "KY", :full_name => "Kentucky"
State.create :abbreviation => "LA", :full_name => "Louisiana"
State.create :abbreviation => "ME", :full_name => "Maine"
State.create :abbreviation => "MD", :full_name => "Maryland"
State.create :abbreviation => "MA", :full_name => "Massachusetts"
State.create :abbreviation => "MI", :full_name => "Michigan"
State.create :abbreviation => "MN", :full_name => "Minnesota"
State.create :abbreviation => "MS", :full_name => "Mississippi"
State.create :abbreviation => "MO", :full_name => "Missouri"
State.create :abbreviation => "MT", :full_name => "Montana"
State.create :abbreviation => "NE", :full_name => "Nebraska"
State.create :abbreviation => "NV", :full_name => "Nevada"
State.create :abbreviation => "NH", :full_name => "New Hampshire"
State.create :abbreviation => "NJ", :full_name => "New Jersey"
State.create :abbreviation => "NM", :full_name => "New Mexico"
State.create :abbreviation => "NY", :full_name => "New York"
State.create :abbreviation => "NC", :full_name => "North Carolina"
State.create :abbreviation => "ND", :full_name => "North Dakota"
State.create :abbreviation => "OH", :full_name => "Ohio"
State.create :abbreviation => "OK", :full_name => "Oklahoma"
State.create :abbreviation => "OR", :full_name => "Oregon"
State.create :abbreviation => "PA", :full_name => "Pennsylvania"
State.create :abbreviation => "RI", :full_name => "Rhode Island"
State.create :abbreviation => "SC", :full_name => "South Carolina"
State.create :abbreviation => "SD", :full_name => "South Dakota"
State.create :abbreviation => "TN", :full_name => "Tennessee"
State.create :abbreviation => "TX", :full_name => "Texas"
State.create :abbreviation => "UT", :full_name => "Utah"
State.create :abbreviation => "VT", :full_name => "Vermont"
State.create :abbreviation => "VA", :full_name => "Virginia"
State.create :abbreviation => "WA", :full_name => "Washington"
State.create :abbreviation => "WV", :full_name => "West Virginia"
State.create :abbreviation => "WI", :full_name => "Wisconsin"
State.create :abbreviation => "WY", :full_name => "Wyoming"
