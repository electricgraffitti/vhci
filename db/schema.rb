# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110207180532) do

  create_table "advertisements", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "ad_type"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ad_image_file_name"
    t.string   "ad_image_content_type"
    t.integer  "ad_image_file_size"
    t.datetime "ad_image_updated_at"
    t.string   "link_url"
    t.integer  "listed_order"
    t.date     "expiration_date"
  end

  create_table "article_types", :force => true do |t|
    t.string   "article_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "article_type_id"
    t.string   "keywords"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "meta_description"
    t.boolean  "third_party"
    t.string   "third_party_url"
  end

  add_index "articles", ["article_type_id"], :name => "index_articles_on_article_type_id"

  create_table "assets", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "headline"
    t.text     "content"
    t.boolean  "secondary_banners"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "button_color"
    t.string   "button_position"
    t.string   "button_text"
    t.string   "button_url"
    t.integer  "banner_count"
    t.boolean  "active_banner"
  end

  create_table "brochures", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.string   "keywords"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brochure_file_name"
    t.string   "brochure_content_type"
    t.integer  "brochure_file_size"
    t.datetime "brochure_updated_at"
  end

  add_index "brochures", ["service_id"], :name => "index_brochures_on_service_id"

  create_table "business_types", :force => true do |t|
    t.string   "business_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "case_studies", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.string   "keywords"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "case_study_file_name"
    t.string   "case_study_content_type"
    t.integer  "case_study_file_size"
    t.datetime "case_study_updated_at"
  end

  add_index "case_studies", ["service_id"], :name => "index_case_studies_on_service_id"

  create_table "claim_types", :force => true do |t|
    t.string   "claim_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coverflows", :force => true do |t|
    t.integer  "cflow_id"
    t.string   "cflow_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_types", :force => true do |t|
    t.string   "document_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_extension"
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "document_type_id"
    t.string   "keywords"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "meta_description"
    t.string   "issuu_url"
    t.boolean  "brochure"
    t.integer  "brochure_order"
    t.integer  "service_id"
    t.text     "brochure_sub_heading"
    t.string   "download_link"
  end

  add_index "documents", ["document_type_id"], :name => "index_documents_on_document_type_id"

  create_table "employee_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "department_id"
    t.string   "ext"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "home_fax"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "last_login_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "employees", ["department_id"], :name => "index_employees_on_department_id"
  add_index "employees", ["role_id"], :name => "index_employees_on_role_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "keywords"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "meta_description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "website_url"
    t.string   "place"
  end

  create_table "friend_invites", :force => true do |t|
    t.string   "sender_name"
    t.string   "receiver_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goal_types", :force => true do |t|
    t.string   "goal_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issuus", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link_url"
    t.string   "keywords"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "meta_description"
  end

  create_table "newsletter_subscriptions", :force => true do |t|
    t.string   "email"
    t.boolean  "active_subscription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", :force => true do |t|
    t.integer  "ticket_id"
    t.string   "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "owners", ["employee_id"], :name => "index_owners_on_employee_id"
  add_index "owners", ["ticket_id"], :name => "index_owners_on_ticket_id"

  create_table "pages", :force => true do |t|
    t.string   "page_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", :force => true do |t|
    t.string   "priority_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "priority_name"
  end

  create_table "quotes", :force => true do |t|
    t.string   "line_1"
    t.string   "line_2"
    t.string   "line_3"
    t.string   "author"
    t.integer  "line_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_bullets", :force => true do |t|
    t.integer  "service_id"
    t.string   "bullet_point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_inquiries", :force => true do |t|
    t.integer  "business_type_id"
    t.integer  "claim_type_id"
    t.integer  "goal_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "keywords"
    t.string   "permalink"
    t.text     "meta_description"
    t.string   "quote"
    t.text     "problem"
    t.text     "solution"
    t.string   "acronym"
    t.string   "landing_link"
    t.integer  "claim_type_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitemap_settings", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "xml_location"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitemap_static_links", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.float    "priority"
    t.string   "frequency"
    t.string   "section"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitemap_widgets", :force => true do |t|
    t.string   "widget_model"
    t.string   "index_named_route"
    t.string   "frequency_index"
    t.string   "frequency_show"
    t.float    "priority"
    t.string   "custom_finder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "abbreviation", :limit => 2
    t.string   "full_name"
    t.boolean  "display",                   :default => true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_assets", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "ticket_assignments", :force => true do |t|
    t.integer  "ticket_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ticket_assignments", ["employee_id"], :name => "index_ticket_assignments_on_employee_id"
  add_index "ticket_assignments", ["ticket_id"], :name => "index_ticket_assignments_on_ticket_id"

  create_table "ticket_statuses", :force => true do |t|
    t.string   "status_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status_name"
  end

  create_table "ticket_updates", :force => true do |t|
    t.text     "comment"
    t.integer  "employee_id"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ticket_updates", ["employee_id"], :name => "index_ticket_updates_on_employee_id"
  add_index "ticket_updates", ["ticket_id"], :name => "index_ticket_updates_on_ticket_id"

  create_table "tickets", :force => true do |t|
    t.string   "subject"
    t.text     "description"
    t.date     "due_date"
    t.integer  "ticket_status_id"
    t.integer  "priority_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["priority_id"], :name => "index_tickets_on_priority_id"
  add_index "tickets", ["ticket_status_id"], :name => "index_tickets_on_ticket_status_id"

  create_table "tutorial_videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tutorial_video_file_name"
    t.string   "tutorial_video_content_type"
    t.integer  "tutorial_video_file_size"
    t.datetime "tutorial_video_updated_at"
    t.string   "tutorial_video_thumb_file_name"
    t.string   "tutorial_video_thumb_content_type"
    t.integer  "tutorial_video_thumb_file_size"
    t.datetime "tutorial_video_thumb_updated_at"
  end

  create_table "uni_resources", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "featured"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uni_res_avatar_file_name"
    t.string   "uni_res_avatar_content_type"
    t.integer  "uni_res_avatar_file_size"
    t.datetime "uni_res_avatar_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_types", :force => true do |t|
    t.string   "video_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "video_type_id"
    t.boolean  "third_party"
    t.string   "third_party_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "permalink"
    t.string   "video_thumb_file_name"
    t.string   "video_thumb_content_type"
    t.integer  "video_thumb_file_size"
    t.datetime "video_thumb_updated_at"
  end

end
