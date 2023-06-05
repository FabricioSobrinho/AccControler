def reWriteLine(nameAcountOwner, newBalance, i)
  @balanceAccOwners[i] = newBalance
  newBalance.to_s

  @lines.each_with_index do |line, index|
    if line.include?(nameAcountOwner)
      @lines[index += 2] = "#{newBalance}\n"
    end
  end
  File.open(@file, "w") do |f|
    f.write(@lines.join)
  end
  rows = []
  rows << ["Operação concluída com sucesso!"]
  table = Terminal::Table.new :rows => rows

  puts table
end
