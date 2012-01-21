# == Schema Information
#
# Table name: video_types
#
#  id         :integer(4)      not null, primary key
#  video_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VideoType < ActiveRecord::Base
  
  has_many :videos
  
end
