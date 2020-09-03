class TransactionsController < ApplicationController
  def home
  end

  def header
  end
  

  def create
    Transactions.delete_all
    Stores.delete_all
    
    Payments.create(descricao: "Débito", natureza: "Entrada", sinal: 1)
    Payments.create(descricao: "Boleto", natureza: "Saída", sinal: -1)
    Payments.create(descricao: "Financiamento", natureza: "Saída", sinal: -1)
    Payments.create(descricao: "Crédito", natureza: "Entrada", sinal: 1)
    Payments.create(descricao: "Recebimento Empréstimo", natureza: "Entrada", sinal: 1)
    Payments.create(descricao: "Recebimento TED", natureza: "Entrada", sinal: 1)
    Payments.create(descricao: "Recebimento DOC", natureza: "Entrada", sinal: 1)
    Payments.create(descricao: "Aluguel", natureza: "Saída", sinal: -1)

    
    file_data = File.read(params[:archive])
    file_data.each_line do |line|
      dt = Date.parse("#{line[1..4]}-#{line[5..6]}-#{line[7..8]}")
      t = "#{line[42..43].to_i-4}:#{line[44..45]}:#{line[46..47]}"
      Stores.create(
        name: line[62...81].strip,
        owner: line[48...62].strip,
        balance: 0
      )

      id = Stores.where(name: line[62...81].strip, owner: line[48...62].strip).ids
      p id

      Transactions.create(
        payment_type: line[0].to_i,
        date: line[1...9],
        value: line[9...19].to_f / 100,
        cpf: line[19...30],
        card: line[30...42],
        time:  Time.parse(t, dt),
        owner: line[48...62].strip,
        store: line[62...81].strip,
        store_id: id[0]
      )

      store = Stores.find_by(id: id)
      store.balance +=  line[9...19].to_f / 100
      store.save 
    
    end
    redirect_to transactions_show_path

  end

  def show
    p "hello vinni"
    @resume = Stores.all
  end
end
