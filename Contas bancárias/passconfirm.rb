def passConfirm(i)
  pass = gets.chomp
  count = 1
  if pass != @accPasswords[i]
    while pass != @accPasswords[i] && count <= 2
      count += 1
      puts "=" * 75
      puts "Senha incorreta insira sua senha novamente: "
      pass = gets.chomp
    end
  end
  if pass == @accPasswords[i] && count <= 3
    return true
  else
    puts "=" * 75
    puts "Número de tentativas máximo alcançado."
    return false
  end
end
