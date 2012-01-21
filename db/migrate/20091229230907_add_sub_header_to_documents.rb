class AddSubHeaderToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :brochure_sub_heading, :text
  end

  def self.down
    remove_column :documents, :brochure_sub_heading
  end
end
