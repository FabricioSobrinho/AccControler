def withdraw(i)
  puts "=" * 75
  puts "Prosseguir para o saque? Se sim digite 1 se não aperte qualquer outra tecla:"
  optionWithdraw = gets.chomp.to_i
  if optionWithdraw == 1
    puts "=" * 75
    puts "Insira a quantia a ser sacada: "
    withdrawMontant = gets.chomp.to_f
    while withdrawMontant == 0.0 
      puts "Insira uma quantia válida para a operação."
      withdrawMontant = gets.chomp.to_f
    end
    if withdrawMontant > @balanceAccOwners[i]
      puts "=" * 75
      puts "Saldo insuficiente."
      operationsAcc(i)
    else
      puts "=" * 75
      puts "Insira sua senha para confirmar a operação. \n Em caso de mais de 3 tentativas a operação será finalizada."
      if passConfirm(i)
        newBalanceAcc = @balanceAccOwners[i] - withdrawMontant
        reWriteLine(@accOwners[i], newBalanceAcc, i)
        operationsAcc(i)
      else
        operationsAcc(i)
      end
    end
  elsif operationsAcc(i)
  end
end
