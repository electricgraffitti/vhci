class AddFieldsToQuotes < ActiveRecord::Migration
  def self.up
    add_column :quotes, :page_id, :integer
    remove_column :quotes, :service_id
    remove_column :quotes, :page
  end

  def self.down
    remove_column :quotes, :page_id
    add_column :quotes, :service_id, :integer
    add_column :quotes, :page, :string
  end
end
