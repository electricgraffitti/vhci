class CreateArticleTypes < ActiveRecord::Migration
  def self.up
    create_table :article_types do |t|
      t.string :article_type
      t.integer :article_id

      t.timestamps
    end
  end

  def self.down
    drop_table :article_types
  end
end
