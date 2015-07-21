class CreateMsgs < ActiveRecord::Migration
  def up 
    create_table :msgs do |t|
 
      t.string :subject
      t.string :sender_id
      t.string :sender_buildingNum
      t.string :sender_email
      t.string :recipient_id
      t.string :recipient_buildingNum
      t.string :recipient_email
      t.string :body
      t.string :attachment
      t.timestamps
    end
  end

  def down
    drop_table :msgs
  end  
end
