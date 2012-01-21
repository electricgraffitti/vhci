# == Schema Information
#
# Table name: articles
#
#  id               :integer(4)      not null, primary key
#  title            :string(255)
#  description      :text
#  article_type_id  :integer(4)
#  keywords         :string(255)
#  meta_description :text
#  permalink        :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  third_party      :boolean(1)
#  third_party_url  :string(255)
#

class Article < ActiveRecord::Base
  
  include ActionView::Helpers::UrlHelper
  
  belongs_to :article_type
  after_update :save_assets
  
  has_many :assets, :as => :attachable
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  has_many :coverflows, :as => :cflow, :class_name => "Coverflow"
  accepts_nested_attributes_for :coverflows, :allow_destroy => true
  
  # Validations
  validates_presence_of :title, :description, :permalink
  
  # Thinking Sphinx Indexes
  define_index do
    indexes description
    indexes title
  end
  
  # RedCloth (textilize)
  # acts_as_textiled  :description
  
  # Scopes
  
  # scope :editable_locations, lambda {|u| where('location_roles.user_id = ? AND location_admin = ?', u, true).includes(:location_roles)}
  scope :no_press, where('article_types.article_type != ?', 'press_release').order("articles.created_at DESC").includes(:article_type, :assets)
  scope :type, lambda { |typea| where('article_types.article_type = ?', typea).order("articles.created_at DESC").includes(:article_type, :assets)}
  scope :last_created, order("created_at DESC")
  
  #============================= Class Methods ==================================#
  
  # Sets Permalink Routes
  def to_param
    "#{id}-#{permalink}"
  end
  
  # Sets up the Pagination call Article.list(number, params[:page])
  def self.list(count, page, typea)
    where('article_type.article_type != ?', typea).includes(:article_type, :assets)
    paginate :per_page => count, :page => page, :order => "created_at DESC"
  end
  
  #pulls the assets from the form
  # def attachments=(atts)
  #   atts.each do |attachment|
  #     if attachment[:id].blank?
  #       assets.build(attachment)
  #     else
  #       asset = assets.detect { |a| a.id == attachment[:id].to_i }
  #       asset.attributes = attachment
  #     end
  #   end
  # end
  
  # def save_assets
  #   assets.each do |a|
  #     a.save(false)
  #   end
  # end
  
end
