class AddMoreAuthlogicToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :last_login_at, :datetime
  end

  def self.down
    remove_column :employees, :last_login_at
  end
end
