class AddAttachmentsAttachmentToTicketAsset < ActiveRecord::Migration
  def self.up
    add_column :ticket_assets, :attachment_file_name, :string
    add_column :ticket_assets, :attachment_content_type, :string
    add_column :ticket_assets, :attachment_file_size, :integer
    add_column :ticket_assets, :attachment_updated_at, :datetime
  end

  def self.down
    remove_column :ticket_assets, :attachment_file_name
    remove_column :ticket_assets, :attachment_content_type
    remove_column :ticket_assets, :attachment_file_size
    remove_column :ticket_assets, :attachment_updated_at
  end
end
