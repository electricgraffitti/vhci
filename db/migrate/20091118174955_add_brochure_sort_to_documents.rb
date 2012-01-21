class AddBrochureSortToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :brochure_order, :integer
  end

  def self.down
    remove_column :documents, :brochure_order
  end
end
