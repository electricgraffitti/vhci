# == Schema Information
#
# Table name: videos
#
#  id                       :integer(4)      not null, primary key
#  title                    :string(255)
#  description              :text
#  permalink                :string(255)
#  video_type_id            :integer(4)
#  third_party              :boolean(1)
#  third_party_url          :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  video_file_name          :string(255)
#  video_content_type       :string(255)
#  video_file_size          :integer(4)
#  video_updated_at         :datetime
#  video_thumb_file_name    :string(255)
#  video_thumb_content_type :string(255)
#  video_thumb_file_size    :integer(4)
#  video_thumb_updated_at   :datetime
#

class Video < ActiveRecord::Base
   
   belongs_to :video_type

   # Thinking Sphinx Indexes
   define_index do
     indexes description
     indexes title
   end

   # RedCloth (textilize)
   # acts_as_textiled  :description

   # Validations
   validates_presence_of :title, :description, :permalink

   # PaperClip
   has_attached_file :video,
                     :url => "/videos/:id/:style/:basename.:extension",
                     :path => ":rails_root/public/videos/:id/:style/:basename.:extension"
                     
   has_attached_file :video_thumb,
                     :styles => { :full => "512x288>", :small => "283x159>", :thumb => "128x72>" },
                     :url => "/video_thumbs/:id/:style/:basename.:extension",
                     :path => ":rails_root/public/video_thumbs/:id/:style/:basename.:extension"
                     
   # # Paperclip Validations
   # validates_attachment_presence :video
   # validates_attachment_content_type :video, :content_type => ['video/x-msvideo','video/avi','video/quicktime','video/3gpp','video/x-ms-wmv','video/mp4','video/mpeg']
   # 
   # # Attrs
   # attr_protected :video_file_name, :video_content_type, :video_file_size
   
   # Scopes
   scope :type, lambda { |typea| where('video_types.video_type = ?', typea).includes(:video_type)}
   scope :filtered_type, lambda { |typea| where('video_types.video_type != ?', typea).order("videos.created_at DESC").includes(:video_type) }
   scope :last_created, order("videos.created_at DESC")

   #============================= Class Methods ==================================#

   # Sets Permalink Routes
   def to_param
     "#{id}-#{permalink}"
   end
   
   def self.list(count, page)
     paginate(:per_page => count, :page => page, :order => "created_at DESC")
   end
  
end
