class CreateTicketUpdates < ActiveRecord::Migration
  def self.up
    create_table :ticket_updates do |t|
      t.text :comment
      t.integer :employee_id
      t.integer :ticket_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_updates
  end
end
