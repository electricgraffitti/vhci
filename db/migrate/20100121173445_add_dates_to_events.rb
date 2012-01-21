class AddDatesToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
    add_column :events, :website_url, :string
    add_column :events, :place, :string
  end

  def self.down
    remove_column :events, :place
    remove_column :events, :website_url
    remove_column :events, :end_date
    remove_column :events, :start_date
  end
end
