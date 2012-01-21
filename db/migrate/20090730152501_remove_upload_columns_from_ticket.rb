class RemoveUploadColumnsFromTicket < ActiveRecord::Migration
  def self.up
    remove_column :tickets, :ticket_upload_file_name
    remove_column :tickets, :ticket_upload_content_type
    remove_column :tickets, :ticket_upload_file_size
    remove_column :tickets, :ticket_upload_updated_at
  end

  def self.down
    add_column :tickets, :ticket_upload_file_name, :string
    add_column :tickets, :ticket_upload_content_type, :string
    add_column :tickets, :ticket_upload_file_size, :integer
    add_column :tickets, :ticket_upload_updated_at, :datetime
  end
end
