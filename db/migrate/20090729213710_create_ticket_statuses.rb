class CreateTicketStatuses < ActiveRecord::Migration
  def self.up
    create_table :ticket_statuses do |t|
      t.string :status_type

      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_statuses
  end
end
