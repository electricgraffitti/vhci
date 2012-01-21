# == Schema Information
#
# Table name: case_studies
#
#  id                      :integer(4)      not null, primary key
#  title                   :string(255)
#  description             :text
#  permalink               :string(255)
#  keywords                :string(255)
#  service_id              :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#  case_study_file_name    :string(255)
#  case_study_content_type :string(255)
#  case_study_file_size    :integer(4)
#  case_study_updated_at   :datetime
#

class CaseStudy < ActiveRecord::Base
  
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
  has_attached_file :case_study, 
                    :styles => { :thumb => "70x70>" },
                    :url => "/case_studies/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/case_studies/:id/:style_:basename.:extension"
  # Attrs
  attr_protected :case_study_file_name, :case_study_content_type, :case_study_file_size
  
  #============================= Class Methods ==================================#
  
  # Sets Permalink Routes
  def to_param
    "#{id}-#{permalink}"
  end
  
end
