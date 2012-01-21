class Quote < ActiveRecord::Base
  
  belongs_to :page
  
  validates_presence_of :author, 
                        :line_1,
                        :line_3, :on => :create, :message => "can't be blank"
                        
  def self.page_quote(name)
    where('pages.page_name = ?', name).includes(:page)
  end
  
end
