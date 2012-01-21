class AddExtensionToArticleTypesRemoveArticleIdFromArticleType < ActiveRecord::Migration
  def self.up
    remove_column :article_types, :article_id
    add_column :article_types, :article_extension, :string
  end

  def self.down
    add_column :article_types, :article_id, :integer
    remove_column :article_types, :article_extension
  end
end
