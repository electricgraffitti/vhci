class AddAttachmentsBrochureToBrochure < ActiveRecord::Migration
  def self.up
    add_column :brochures, :brochure_file_name, :string
    add_column :brochures, :brochure_content_type, :string
    add_column :brochures, :brochure_file_size, :integer
    add_column :brochures, :brochure_updated_at, :datetime
  end

  def self.down
    remove_column :brochures, :brochure_file_name
    remove_column :brochures, :brochure_content_type
    remove_column :brochures, :brochure_file_size
    remove_column :brochures, :brochure_updated_at
  end
end
