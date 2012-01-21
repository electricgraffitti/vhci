class AddServiceToDocument < ActiveRecord::Migration
  def self.up
    add_column :documents, :service_id, :integer
  end

  def self.down
    remove_column :documents, :service_id
  end
end
