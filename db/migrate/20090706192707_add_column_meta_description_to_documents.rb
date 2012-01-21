class AddColumnMetaDescriptionToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :meta_description, :text
  end

  def self.down
    remove_column :documents, :meta_description
  end
end
