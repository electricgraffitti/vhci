# == Schema Information
#
# Table name: banners
#
#  id                  :integer(4)      not null, primary key
#  headline            :string(255)
#  content             :text
#  secondary_banners   :boolean(1)
#  created_at          :datetime
#  updated_at          :datetime
#  banner_file_name    :string(255)
#  banner_content_type :string(255)
#  banner_file_size    :integer(4)
#  banner_updated_at   :datetime
#  button_color        :string(255)
#  button_position     :string(255)
#  button_text         :string(255)
#  button_url          :string(255)
#  banner_count        :integer(4)
#  active_banner       :boolean(1)
#

class Banner < ActiveRecord::Base
  
  # Callbacks - Hooks
  before_create :increment_object_count

   # Validations
   validates_presence_of :headline, :content, :button_color, :button_position, :button_text, :button_url
   validates_uniqueness_of :banner_count, :on => :create, :message => "must be unique"
   
   # Named Scopes
   named_scope :active_banners, :conditions => ['active_banner = ?', true]
   
   # PaperClip
   has_attached_file :banner,
                     :styles => { :main => "928x483#", :micro => "429x223#", :nav => "77x40#"},
                     :url => "/banners/:id/:style/:basename.:extension",
                     :path => ":rails_root/public/banners/:id/:style/:basename.:extension"
                     
   #============================= Class Methods ==================================#

   def self.random(banners)
     # ids = connection.select_all("SELECT banner_count FROM banners")
     find(banners[rand(banners.length)]["banner_count"].to_i) unless banners.blank?
   end
   
   def increment_object_count
      write_attribute(:banner_count, Banner.count() + 1)
   end
   
end
