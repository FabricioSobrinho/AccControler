require_relative "accControl.rb"
require_relative "passconfirm.rb"
require_relative "operacoes.rb"

def acessAcount
  puts "Bem vindo! Insira seu nome completo para acessar sua conta: "
  nameOwnerAcount = gets.chomp.downcase.strip
  while nameOwnerAcount.empty? == true
    puts "Insira um nome, por favor: "
    nameOwnerAcount = gets.chomp.downcase.strip
  end
  i = @accOwners.find_index { |n| n.strip.chomp.downcase == nameOwnerAcount }
  if i
    puts "Seja bem vindo(a), #{@accOwners[i].capitalize}! Para continuar insira sua senha, por favor! \n Em caso de 3 tentativas incorretas a sessão será finalizada: "
    if passConfirm(i)
      operationsAcc(i)
    else
      puts "sessão encerrada!"
    end
  else
    puts "Você não esta registrado no banco."
  end
end
