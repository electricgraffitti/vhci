class CreateServiceBullets < ActiveRecord::Migration
  def self.up
    create_table :service_bullets do |t|
      t.integer :service_id
      t.string :bullet_point

      t.timestamps
    end
  end

  def self.down
    drop_table :service_bullets
  end
end
