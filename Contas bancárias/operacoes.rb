def operationsAcc(i)
  require_relative "rewriteline.rb"
  require "terminal-table"

  table = Terminal::Table.new do |t|
    t.title = "Seja bem-vindo #{@accOwners[i]}!"
    t.add_row ["Ver saldo", 1]
    t.add_row ["Realizar saque", 2]
    t.add_row ["Realizar deposito", 3]
    t.add_row ["Realizar Transferência", 4]
    t.add_row ["Sair do Banco", 5]
    t.style = { :all_separators => true }
  end
  puts table

  option = gets.chomp.to_i
  if option == 1
    require_relative "consultasaldo.rb"
    balanceUser(i)
  elsif option == 2
    require_relative "saque.rb"
    withdraw(i)
  elsif option == 3
    require_relative "deposito.rb"
    deposit(i)
  elsif option == 4
    require_relative "transfer.rb"
    transfer(i)
  elsif option == 5
    puts "Finalizando sessão, até logo, #{@accOwners[i]}!"
  else
    puts "Operação não conhecida."
    operationsAcc(i)
  end
end
