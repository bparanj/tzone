class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.string :time_zone

      t.timestamps
    end
  end
end
