class AddKeywordsAndPermalinksToServices < ActiveRecord::Migration
  def self.up
    add_column :services, :keywords, :string
    add_column :services, :permalink, :string
  end

  def self.down
    remove_column :services, :keywords
    remove_column :services, :permalink
  end
end
