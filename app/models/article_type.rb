# == Schema Information
#
# Table name: article_types
#
#  id           :integer(4)      not null, primary key
#  article_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class ArticleType < ActiveRecord::Base
  
  has_many :articles
  
end
