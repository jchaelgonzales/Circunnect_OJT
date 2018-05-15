class CreateBloodGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :blood_groups do |t|
      t.string :blood_type

      t.timestamps
    end
  end
end
