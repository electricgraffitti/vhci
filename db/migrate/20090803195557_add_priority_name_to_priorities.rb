class AddPriorityNameToPriorities < ActiveRecord::Migration
  def self.up
    add_column :priorities, :priority_name, :string
  end

  def self.down
    remove_column :priorities, :priority_name
  end
end
