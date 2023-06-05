def transfer(i)
  puts "=" * 75
  puts "Prosseguir para transferências? Se sim digite 1 se não digite qualquer outra tecla."
  optionTransfer = gets.chomp.to_i
  if optionTransfer == 1
    puts "=" * 75
    puts "Insira o nome do Favorecido: "
    transferFav = gets.chomp.strip.downcase
    indexTransferFav = @accOwners.find_index { |n| n.strip.chomp.downcase == transferFav }
    while i == indexTransferFav
      puts "=" * 75
      puts "O favorecido não pode ser você mesmo!"
      puts "Insira o nome do favorecido: "
      transferFav = gets.chomp.strip.downcase
      indexTransferFav = @accOwners.find_index { |n| n.strip.chomp.downcase == transferFav }
    end
    if indexTransferFav
      puts "=" * 75
      puts "Insira o valor a ser transferido para #{@accOwners[indexTransferFav]} "
      valueTransfer = gets.chomp.to_f
      while valueTransfer == 0.0 
        puts "Insira uma quantia válida para a operação."
        valueTransfer = gets.chomp.to_f
      end
      if valueTransfer > @balanceAccOwners[i]
        puts "=" * 75
        puts "Saldo insuficiente para transferência."
        operationsAcc(i)
      else
        puts "=" * 75
        puts "Insira sua senha, em caso de 3 tentativas incorretas a operação será encerrada."
        if passConfirm(i)
          reWriteLine(@accOwners[i], @balanceAccOwners[i] - valueTransfer, i)
          reWriteLine(@accOwners[indexTransferFav], @balanceAccOwners[indexTransferFav] + valueTransfer, indexTransferFav)
          operationsAcc(i)
        end
      end
    else
      puts "=" * 75
      puts "Conta não encontrada."
      operationsAcc(i)
    end
  else
    operationsAcc(i)
  end
end
