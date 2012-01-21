# == Schema Information
#
# Table name: uni_resources
#
#  id                          :integer(4)      not null, primary key
#  title                       :string(255)
#  description                 :text
#  featured                    :boolean(1)
#  permalink                   :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#  uni_res_avatar_file_name    :string(255)
#  uni_res_avatar_content_type :string(255)
#  uni_res_avatar_file_size    :integer(4)
#  uni_res_avatar_updated_at   :datetime
#

class UniResource < ActiveRecord::Base
  
  # Validations
  validates_presence_of :title, :on => :create, :message => "title required"
  validates_presence_of :description, :on => :create, :message => "needs a description"
  validates_presence_of :permalink, :on => :create, :message => "permalink reqiured"
  
  # Thinking Sphinx Indexes
  define_index do
    indexes description
    indexes title
  end
  
  # PaperClip
  has_attached_file :uni_res_avatar, 
                    :styles => { :small => "100x110>", :banner_tile => "90x90>", :thumb => "82x90>" },
                    :url => "/iu_avatars/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/iu_avatars/:id/:style_:basename.:extension"
  # Attrs
  attr_protected :uni_res_avatar_file_name, :uni_res_avatar_content_type, :uni_res_avatar_file_size
  
  # Scopes
  scope :featured, where("featured = ?", true)
  scope :last_created, order("created_at DESC")
  
  #============================= Class Methods ==================================#
  
  # Sets Permalink Routes
  def to_param
    "#{id}-#{permalink}-center"
  end
  
end
