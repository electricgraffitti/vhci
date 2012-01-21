class RemoveArticleExtensioFromArticleTypes < ActiveRecord::Migration
  def self.up
    remove_column :article_types, :article_extension
  end

  def self.down
    add_column :article_types, :article_extension, :string
  end
end
