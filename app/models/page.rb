class Page < ActiveRecord::Base
  
  has_many :quotes
  
  validates :page_name, :presence => true
  
end
