def createacc
  puts "Vamos criar uma nova conta! para prosseguir digite 1 para cancelar a operação digite qualquer outra tecla."
  optionCreate = gets.chomp.to_i

  if optionCreate == 1
    puts "Para começar insira seu nome Completo: "
    nameNewClient = gets.chomp.strip
    while nameNewClient.empty?
      puts "Insira um nome, por favor: "
      nameNewClient = gets.chomp.strip
    end
    puts "Muito bem, #{nameNewClient}, agora insira uma senha com pelo menos 6 caracteres: "
    passNewClient = gets.chomp.strip

    def doublePassConfirm(passNewClient)
      puts "Confirme sua senha: "
      passNewClientConfirm = gets.chomp.strip
      while passNewClientConfirm != passNewClient
        puts "As senhas não são iguais, insira novamente sua senha: "
        passNewClient = gets.chomp.strip
        puts "Confirme sua senha: "
        passNewClientConfirm = gets.chomp.strip
      end
      return passNewClient
    end

    confirm = doublePassConfirm(passNewClient)

    if confirm.length < 6 || confirm.include?(" ")
      if confirm.include?(" ")
        while confirm.include?(" ")
          puts "A senha não pode conter espaços, insira uma nova senha, por favor: "
          passNewClient = gets.chomp.strip
          confirm = doublePassConfirm(passNewClient)
        end
      end
      if confirm.length < 6
        while confirm.length < 6
          puts "A senha deve ter mais de 6 caracteres, insira uma nova senha, por favor: "
          passNewClient = gets.chomp.strip
          confirm = doublePassConfirm(passNewClient)
        end
      end
    end
    passNewClient = confirm
    File.open("contas.txt", "a") do |line|
      line.puts(" ")
      line.puts("titular:")
      line.puts(nameNewClient)
      line.puts("saldo:")
      line.puts("00.0")
      line.puts("senha:")
      line.puts(passNewClient)
    end
    puts "Seja Bem vindo ao Banco, #{nameNewClient}!"
    puts "Você poderá iniciar sua sessão no próximo login, aproveite o banco!"
  else
    puts "Até logo!"
  end
end
