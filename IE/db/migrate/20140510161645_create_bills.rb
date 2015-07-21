class CreateBills < ActiveRecord::Migration
  def up 
    create_table :bills do |t|
      t.string :monthlybill_id
      t.string :billType
      t.string :name
      t.integer :amount
      t.text :description

      t.timestamps
    end
    add_index("bills", "monthlybill_id")
  end

  def down
    drop_table :bills
  end
end
