class AddProsolColumnsToService < ActiveRecord::Migration
  def self.up
    add_column :services, :problem, :text
    add_column :services, :solution, :text
  end

  def self.down
    remove_column :services, :solution
    remove_column :services, :problem
  end
end
