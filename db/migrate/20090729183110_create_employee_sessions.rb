class CreateEmployeeSessions < ActiveRecord::Migration
  def self.up
    create_table :employee_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_sessions
  end
end
