# == Schema Information
#
# Table name: tutorial_videos
#
#  id                                :integer(4)      not null, primary key
#  title                             :string(255)
#  description                       :text
#  permalink                         :string(255)
#  created_at                        :datetime
#  updated_at                        :datetime
#  tutorial_video_file_name          :string(255)
#  tutorial_video_content_type       :string(255)
#  tutorial_video_file_size          :integer(4)
#  tutorial_video_updated_at         :datetime
#  tutorial_video_thumb_file_name    :string(255)
#  tutorial_video_thumb_content_type :string(255)
#  tutorial_video_thumb_file_size    :integer(4)
#  tutorial_video_thumb_updated_at   :datetime
#
class TutorialVideo < ActiveRecord::Base

   # Thinking Sphinx Indexes
   define_index do
     indexes description
     indexes title
   end

   # Validations
   validates_presence_of :title, :description, :permalink

   # PaperClip
   has_attached_file :tutorial_video,
                     :url => "/tutorial_videos/:id/:style/:basename.:extension",
                     :path => ":rails_root/public/tutorial_videos/:id/:style/:basename.:extension"
                     
   has_attached_file :tutorial_video_thumb,
                     :styles => { :full => "512x288>", :thumb => "128x72>" },
                     :url => "/tutorial_video_thumbs/:id/:style/:basename.:extension",
                     :path => ":rails_root/public/tutorial_video_thumbs/:id/:style/:basename.:extension"

   #============================= Class Methods ==================================#

   # Sets Permalink Routes
   def to_param
     "#{id}-#{permalink}"
   end
   
   def self.list(count, page)
     paginate :per_page => count, :page => page, :order => "created_at DESC"
   end
   
end
