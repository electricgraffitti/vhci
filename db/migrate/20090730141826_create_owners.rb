class CreateOwners < ActiveRecord::Migration
  def self.up
    create_table :owners do |t|
      t.integer :ticket_id
      t.string :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :owners
  end
end
