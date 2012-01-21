class AddDownloadLinkToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :download_link, :string
  end

  def self.down
    remove_column :documents, :download_link
  end
end
