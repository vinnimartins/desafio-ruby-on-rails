class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :payment_type
      t.date :date 
      t.float :value
      t.string :cpf
      t.string :card 
      t.datetime :time
      t.string :owner
      t.string :store
      t.integer :store_id  
    end
  end
end
