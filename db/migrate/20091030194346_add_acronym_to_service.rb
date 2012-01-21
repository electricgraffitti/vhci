class AddAcronymToService < ActiveRecord::Migration
  def self.up
    add_column :services, :acronym, :string
  end

  def self.down
    remove_column :services, :acronym
  end
end
