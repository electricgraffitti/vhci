class AddIssuuUrlToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :issuu_url, :string
  end

  def self.down
    remove_column :documents, :issuu_url
  end
end
