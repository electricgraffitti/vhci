class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :subject
      t.text :description
      t.date :due_date
      t.integer :ticket_status_id
      t.integer :priority_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
