def balanceUser(i)
  rows = []
  rows << ["Seu saldo é de #{@balanceAccOwners[i]}, #{@accOwners[i].capitalize}"]
  table = Terminal::Table.new :rows => rows

  puts table
  operationsAcc(i)
end
