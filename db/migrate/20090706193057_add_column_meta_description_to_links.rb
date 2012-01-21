class AddColumnMetaDescriptionToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :meta_description, :text
  end

  def self.down
    remove_column :links, :meta_description
  end
end
