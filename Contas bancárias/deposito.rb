def deposit(i)
  puts "=" * 75
  puts "Prosseguir para o deposito? Se sim aperte 1, em caso de cancelmento aperte qualquer outra tecla."
  optionDeposit = gets.chomp.to_i
  if optionDeposit == 1
    puts "=" * 75
    puts "O favorecido é você mesmo? Se sim digite 1 se não digite 0: "
    optionFav = gets.chomp
    while optionFav != "1" && optionFav != "0"
      puts "=" * 75
      puts "Insira uma opção válida por favor: "
      optionFav = gets.chomp
    end
    if optionFav == "1"
      puts "=" * 75
      puts "Insira a quantia que deseja depositar: "
      depositValue = gets.chomp.to_f
      while depositValue == 0.0 
        puts "Insira uma quantia válida para a operação."
        depositValue = gets.chomp.to_f
      end
      newBalanceAcc = depositValue + @balanceAccOwners[i]
      puts "=" * 75
      puts "Insira sua senha para confirmar a operação. \n Em caso de 3 tentativas incorretas a operação será cancelada."
      if passConfirm(i)
        reWriteLine(@accOwners[i], newBalanceAcc, i)
        operationsAcc(i)
      else
        operationsAcc(i)
      end
    elsif optionFav == "0"
      puts "Digite o nome do favorecido: "
      nameFav = gets.chomp.strip.downcase
      ind = @accOwners.find_index { |n| n.strip.chomp.downcase == nameFav }
      if ind
        puts "=" * 75
        puts "Insira a quantia a ser depositada para #{@accOwners[ind]}"
        depositValue = gets.chomp.to_f
        while depositValue == 0.0 
          puts "Insira uma quantia válida para a operação."
          depositValue = gets.chomp.to_f
        end
        newBalanceAcc = depositValue + @balanceAccOwners[ind]
        puts "=" * 75
        puts "Insira sua senha para confirmar a operação. \n Em caso de 3 tentativas incorretas a operação será cancelada."
        if passConfirm(i)
          reWriteLine(@accOwners[ind], newBalanceAcc, ind)
          operationsAcc(i)
        else
          operationsAcc(i)
        end
      else
        puts "=" * 75
        puts "Conta não encontrada."
        operationsAcc(i)
      end
    else
      puts "=" * 75
      puts "Operação não identificada."
      operationsAcc(i)
    end
  else
    operationsAcc(i)
  end
end
