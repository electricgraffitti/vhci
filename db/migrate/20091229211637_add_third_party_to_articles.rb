class AddThirdPartyToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :third_party, :boolean
    add_column :articles, :third_party_url, :string
  end

  def self.down
    remove_column :articles, :third_party_url
    remove_column :articles, :third_party
  end
end
