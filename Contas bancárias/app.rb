require_relative "acessAcount.rb"

def enterAcc
  puts "Seja bem vindo(a)! Já é Cliente ?"
  puts "Digite 1 para acessar uma conta já existente ou 0 para criar uma nova conta: "
  optionMenu = gets.chomp

  while optionMenu != "1" && optionMenu != "0"
    puts "Insira uma operação válida."
    optionMenu = gets.chomp
  end

  if optionMenu == "1"
    acessAcount()
  elsif optionMenu == "0"
    require_relative "createacc.rb"
    createacc()
  end
end

enterAcc
