class CreateCharges < ActiveRecord::Migration
  def up 
    create_table :charges do |t|

      t.string :buildingNum_id
      t.string :usr_id
      t.string :monthlybill_id
      t.string :chargeMonth
      t.string :chargeYear
      t.string :amount
      t.string :chargeDescription

      t.timestamps
    end
  end

  def down
    drop_table :charges
  end
end
