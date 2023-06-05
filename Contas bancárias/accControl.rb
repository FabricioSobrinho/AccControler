@file = "contas.txt"
@lines = File.readlines(@file)
@accOwners = []
@balanceAccOwners = []
@accPasswords = []
lines = @lines
@i = 0

def registerAcounts(lines) #Metódo para ler o arquivo e registrar as contas
  lines.each do |line|
    if (line.include?("titular"))
      @accOwners << lines[@i + 1].strip.chomp
    elsif (line.include?("saldo"))
      @balanceAccOwners << lines[@i + 1].strip.chomp.to_f
    elsif (line.include?("senha"))
      @accPasswords << lines[@i + 1].strip.chomp
    end
    @i += 1
  end
end

registerAcounts(lines)
