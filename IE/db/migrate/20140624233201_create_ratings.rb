class CreateRatings < ActiveRecord::Migration
  def up 
    create_table :ratings do |t|
      t.integer :commentid
      t.string :clicker_id
      t.string :buildingNum_id

      t.timestamps
    end
  end
  def down
    drop_table :ratings
  end
end
