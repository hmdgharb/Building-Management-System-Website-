class CreateUsrs < ActiveRecord::Migration
  def up 
    create_table :usrs do |t|
      t.string :usageType
      t.string :firstN
      t.string :sureN
      t.string :telNum
      t.string :email
      t.string :password_digest
      t.string :buildingNum
      t.integer :cash
      t.integer :familyNum
      t.timestamps
    end
  end

  def down
    drop_table :usrs
  end
end
