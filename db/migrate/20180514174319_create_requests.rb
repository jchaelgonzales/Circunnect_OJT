class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :request_accepted
      t.string :request_finder
      t.string :request_donor

      t.timestamps
    end
  end
end
