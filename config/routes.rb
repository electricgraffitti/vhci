Hci3::Application.routes.draw do
  
  # Verisk Pages
  match 'payment_accuracy' => 'payment_accuracy#home', :as => :home
  match 'claims_editing' => 'payment_accuracy#claim_editing', :as => :claim_editing
  match 'fraud_prevention' => 'payment_accuracy#fraud_prevention', :as => :fraud_prevention
  match 'bill_review' => 'payment_accuracy#bill_review', :as => :bill_review
  match 'about_us' => 'payment_accuracy#about_us', :as => :about_us
  match 'nucleus' => 'payment_accuracy#nucleus', :as => :nucleus
  match 'more_info' => 'payment_accuracy#more_info', :as => :more_info

  # Mail Route Paths
  match 'contacts_mailer' => "contacts#contacts_mailer", :as => :contact_mailer
  
  # Admin Paths
  match "login" => "user_sessions#new", :as => :login
  match "logout" => "user_sessions#destroy", :as => :logout
  match "hci-services" => "users#admin_services", :as => :admin_services
  match "hci-articles" => "users#admin_articles", :as => :admin_articles
  match "hci-events" => "users#admin_events", :as => :admin_events
  match "hci-videos" => "users#admin_videos", :as => :admin_videos
  match "hci-tutorial-videos" => "users#admin_tutorial_videos", :as => :admin_tutorial_videos
  match "hci-documents" => "users#admin_documents", :as => :admin_documents
  match "hci-banners" => "users#admin_banners", :as => :admin_banners
  match "hci-advertisements" => "users#admin_ads", :as => :admin_ads
  match "hci-quotes" => "users#admin_quotes", :as => :admin_quotes
  
  # Custom Named Routes
  match "invite-a-friend" => "landing_pages#invite_friend", :as => :invite_friend
  match "thank-you-for-inviting-a-friend" => "landing_pages#invite_thank_you", :as => :invite_thank_you
  match "upload-issuu" => "issuu_uploads#index", :as => :issuu_upload
  match "healthcare-insight-document" => 'issuu_uploads#show', :as => :issue
  # match "nucleus" => "pages#nucleus", :as => :nucleus
  match "healthcare-insight-markets" => "pages#markets", :as => :markets
  match "healthcare-insight-resources" => "pages#resources", :as => :res
  match "healthcare-insight-press-kit" => "pages#press_kit", :as => :press_kit
  match "contact-healthcare-insight" => "contacts#contact_us", :as => :contact
  match "thank-you" => "contacts#thank_you", :as => :contact_thank_you
  match "health-care-press" => "announcements#index", :as => :press
  match "health-care-resources" => "resources#index", :as => :media
  match "careers" => "pages#careers", :as => :careers
  match "healthcare-insight-partners" => "pages#partner", :as => :partners
  match "healthcare-insight-accreditations" => "pages#accreditations", :as => :accreditations
  match "healthcare-insight-privacy-policy-and-disclaimers" => "pages#privacy_policy", :as => :privacy
  match "healthcare-insight-social-media-links" => "pages#social_media", :as => :social
  match "public-sector-claims-payment-software-solutions" => "pages#public_sector", :as => :public_sector
  match "private-sector-claims-payment-software-solutions" => "pages#private_sector", :as => :private_sector
  match "property-and-casualty" => "pages#property_casualty", :as => :property_casualty
  match "health-care-search-results" => 'search#index', :as => :search
  match "healthcare-insight-sitemap" => 'sitemap#sitemap', :as => :sitemap

  match "employee_login" => "employee_sessions#new", :as => :employee_login
  match "employee_logout" => "employee_sessions#destroy", :as => :employee_logout
  match "about-healthcare-insight" => "pages#about", :as => :about
  
  # Insight U Routes
  match "insight-university" => "university#index", :as => :university
  match "insight-university" => "university#iu_services", :as => :iuservices
  match "insight-university-resources" => "university#iu_resources", :as => :iuresources
  match "insight-university-login" => "student_sessions#new", :as => :student_login
  match "insight-university-logout" => "student_sessions#destroy", :as => :student_logout
  
  # Landing Page Returns
  match "claim-saver-webinar-thank-you" => "landing_pages#claim_saver_thank_you", :as => :claim_saver_thank_you
  
  # Redirect Paths
  match "PCI.html" => "pages#PCI", :as => :pci
  match "FCI.html" => "pages#FCI", :as => :fci
  match "DCI.html" => "pages#DCI", :as => :dci
  match "OCI.html" => "pages#OCI", :as => :oci
  match "PublicSector.html" => "pages#public_sector", :as => :pubsec
  match "PrivateSector.html" => "pages#private_sector", :as => :prisec
  match "PandC.html" => "pages#property_casualty", :as => :pncsec
  match "AboutUs.html" => "pages#about", :as => :oldabout
  match "Careers.html" => "pages#careers", :as => :oldcareers
  match "Services.html" => "pages#services", :as => :oldservices
  
  # Ajax Routes
  
  resources :quotes  
  resources :friend_invites
  resources :tutorial_videos
  resources :students
  resources :student_sessions
  resources :advertisements
  resources :goal_types
  resources :claim_types
  resources :business_type
  resources :service_inquiries
  resources :videos
  resources :free_trials
  resources :benefits
  resources :newsletter_subscriptions
  resources :tickets, :has_many => :ticket_assets
  resources :ticket_updates
  resources :ticket_statuses
  resources :priorities
  resources :departments
  resources :roles
  resources :employees
  resources :employee_sessions
  resources :document_types
  resources :coverflows
  resources :documents, :has_many => :assets
  resources :links, :has_many => :assets
  resources :article_types
  resources :articles, :has_many => :assets
  resources :events, :has_many => :assets
  resources :services, :has_many => :assets
  resources :users
  resources :user_sessions
  resources :uni_resources
  resources :banners
  resources :claim_savers
  
  # Default Path
  root :to => "payment_accuracy#home"

end
