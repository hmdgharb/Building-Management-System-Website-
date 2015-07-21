class CreateRecipts < ActiveRecord::Migration
  def up 
    create_table :recipts do |t|

      t.string :monthlybill_id
      t.string :buildingNum_id
      t.string :usr_id
      t.string :Month
      t.string :Year
      t.string :amount

      t.timestamps
    end
  end

  def down
    drop_table :recipts
  end
end
