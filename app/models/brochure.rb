# == Schema Information
#
# Table name: brochures
#
#  id                    :integer(4)      not null, primary key
#  title                 :string(255)
#  description           :text
#  permalink             :string(255)
#  keywords              :string(255)
#  service_id            :integer(4)
#  created_at            :datetime
#  updated_at            :datetime
#  brochure_file_name    :string(255)
#  brochure_content_type :string(255)
#  brochure_file_size    :integer(4)
#  brochure_updated_at   :datetime
#

class Brochure < ActiveRecord::Base
  
  belongs_to :service
  
  # Thinking Sphinx Indexes
  define_index do
    indexes description
    indexes title
  end
  
  # RedCloth (textilize)
  # acts_as_textiled  :description
  
  # Validations
  # validates_presence_of :title, :description, :permalink
  
  # PaperClip
  has_attached_file :brochure, 
                    :styles => { :thumb => "70x70>" },
                    :url => "/brochures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/brochures/:id/:style_:basename.:extension"
  # Attrs
  attr_protected :brochure_file_name, :brochure_content_type, :brochure_file_size
  
  #============================= Class Methods ==================================#
  
  # Sets Permalink Routes
  def to_param
    "#{id}-#{permalink}"
  end
  
  
end
