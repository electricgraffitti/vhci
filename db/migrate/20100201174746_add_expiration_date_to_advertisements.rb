class AddExpirationDateToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :expiration_date, :date
  end

  def self.down
    remove_column :advertisements, :expiration_date
  end
end
