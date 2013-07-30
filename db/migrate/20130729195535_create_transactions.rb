class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.integer :assignment_id
      t.integer :writer_id


      t.timestamps
    end
  end
end
