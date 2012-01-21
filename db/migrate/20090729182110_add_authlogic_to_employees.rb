class AddAuthlogicToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :crypted_password, :string
    add_column :employees, :password_salt, :string
    add_column :employees, :persistence_token, :string
  end

  def self.down
    remove_column :employees, :persistence_token
    remove_column :employees, :password_salt
    remove_column :employees, :crypted_password
  end
end
