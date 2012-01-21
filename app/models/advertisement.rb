# == Schema Information
#
# Table name: advertisements
#
#  id                    :integer(4)      not null, primary key
#  title                 :string(255)
#  description           :text
#  ad_type               :string(255)
#  active                :boolean(1)
#  created_at            :datetime
#  updated_at            :datetime
#  ad_image_file_name    :string(255)
#  ad_image_content_type :string(255)
#  ad_image_file_size    :integer(4)
#  ad_image_updated_at   :datetime
#  link_url              :string(255)
#  listed_order          :integer(4)
#  expiration_date       :date
#

class Advertisement < ActiveRecord::Base
  
  # Validations
  validates_presence_of :title, :description, :ad_type
  # validates_attachment_presence :pic
  # validates_attachment_content_type :pic, :content_type => ["image/jpeg", "image/png", "image/gif"]
  
  
  
  #paperclip
  has_attached_file :ad_image, 
                    :styles => { :reg => "280x116#", :thumb => "125x52#" },
                    :url => "/ad_images/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ad_images/:id/:style_:basename.:extension"
                    
  # Named Scopes
  scope :current_list, where("active = ? && expiration_date > ?", 1, Date.today)
  scope :order_list, order("listed_order ASC")
  
end
