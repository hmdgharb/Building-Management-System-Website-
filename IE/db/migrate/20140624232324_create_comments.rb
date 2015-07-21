class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :buildingNum_id
      t.string :usr_id
      t.string :usr_firstN
      t.string :message
      t.integer :likePoint
      t.integer :dislikePoint    
      t.string :commentType
      t.timestamps
    end
  end
  def down
    drop_table :comments
  end
end
