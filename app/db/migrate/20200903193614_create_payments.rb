class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :descricao
      t.string :natureza
      t.integer :sinal
    end
  end
end
