class AddColumnMetaDescriptionToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :meta_description, :text
  end

  def self.down
    remove_column :articles, :meta_description
  end
end
