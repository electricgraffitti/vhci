class CreateTicketAssignments < ActiveRecord::Migration
  def self.up
    create_table :ticket_assignments do |t|
      t.integer :ticket_id
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_assignments
  end
end
