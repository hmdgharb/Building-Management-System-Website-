class CreateMonthlybills < ActiveRecord::Migration
  def up 
    create_table :monthlybills do |t|
      t.string :usr_id
      t.string :usr_buildingNum
      t.string :month
      t.string :year
      t.string :totalInnerBills
      t.string :totalAmount
      t.string :totalCash
      t.text :description
      t.timestamps
    end
    add_index("monthlybills", "usr_id")
  end

  def down
    drop_table :monthlybills
  end

end
