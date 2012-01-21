class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :company
      t.string :city
      t.integer :state_id
      t.string :zip
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
