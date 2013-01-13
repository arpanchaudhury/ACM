class Number
	def initialize(number)
		@number = number
	end
	
	def isPrime #checking primality of a number
		("1" * @number) !~ /^1?$|^(11+?)\1+$/
	end

	def isCarmichael #performing Fermat's test to find Charmichael numbers or Fermat's pseudo-primes
		if isPrime
			return "#{@number} is normal"
		else
			(2..@number-1).each do |i|
				if (i ** @number) % @number != i
					return "#{@number} is normal"
				end		
			end
			"The number #{@number} is a Carmichael number"
		end	
	end
end

#processing the input
infile = File.open("./input.txt")
number = infile.readline.to_i
infile.close

#processing the output
outfile = File.open("./output.txt","w")
outfile.write(Number.new(number).isCarmichael)
outfile.close
