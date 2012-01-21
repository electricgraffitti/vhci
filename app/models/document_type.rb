# == Schema Information
#
# Table name: document_types
#
#  id                 :integer(4)      not null, primary key
#  document_type      :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  document_extension :string(255)
#

class DocumentType < ActiveRecord::Base
  
  has_many :documents
  
end
