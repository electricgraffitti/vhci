class AddQuoteToService < ActiveRecord::Migration
  def self.up
    add_column :services, :quote, :string
  end

  def self.down
    remove_column :services, :quote
  end
end
