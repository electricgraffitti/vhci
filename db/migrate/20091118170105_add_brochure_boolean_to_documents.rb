class AddBrochureBooleanToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :brochure, :boolean
  end

  def self.down
    remove_column :documents, :brochure
  end
end
