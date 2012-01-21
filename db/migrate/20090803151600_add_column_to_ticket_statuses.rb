class AddColumnToTicketStatuses < ActiveRecord::Migration
  def self.up
    add_column :ticket_statuses, :status_name, :string
  end

  def self.down
    remove_column :ticket_statuses, :status_name
  end
end
