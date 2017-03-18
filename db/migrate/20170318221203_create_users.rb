class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number, :limit => 10
      t.string :email
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip, :limit => 5

      t.timestamps null: false
    end
  end
end
