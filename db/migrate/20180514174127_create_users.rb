class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :month
      t.integer :day
      t.integer :year
      t.string :gender
      t.string :blood_type
      t.string :address_street
      t.string :address_city
      t.string :address_province
      t.string :contact_info
      t.string :avatar
      t.string :user_type
      t.boolean :user_status

      t.timestamps
    end
  end
end