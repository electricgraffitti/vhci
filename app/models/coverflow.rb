# == Schema Information
#
# Table name: coverflows
#
#  id                 :integer(4)      not null, primary key
#  cflow_id           :integer(4)
#  cflow_type         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  cover_file_name    :string(255)
#  cover_content_type :string(255)
#  cover_file_size    :integer(4)
#  cover_updated_at   :datetime
#

class Coverflow < ActiveRecord::Base
  
  belongs_to :cflow, :polymorphic => true
  
  # PaperClip
  has_attached_file :cover, 
                    :styles => { :brochure => "160x65#"},
                    :url => "/covers/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/covers/:id/:style_:basename.:extension"
  # Attrs
  attr_protected :attachment_file_name, :attachment_content_type, :attachment_file_size
  
end
