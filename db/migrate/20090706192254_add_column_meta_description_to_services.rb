class AddColumnMetaDescriptionToServices < ActiveRecord::Migration
  def self.up
    add_column :services, :meta_description, :text
  end

  def self.down
    remove_column :services, :meta_description
  end
end
