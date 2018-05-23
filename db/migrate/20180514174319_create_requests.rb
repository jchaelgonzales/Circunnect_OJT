class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.boolean :request_status
      t.string :donor_username
      t.string :request_username
      

      t.timestamps
    end
  end
end
