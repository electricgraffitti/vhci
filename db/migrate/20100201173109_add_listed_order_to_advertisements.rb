class AddListedOrderToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :listed_order, :integer
  end

  def self.down
    remove_column :advertisements, :listed_order
  end
end
