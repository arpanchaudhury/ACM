#processing the input
infile = File.open("./input.txt")
lines = infile.readline.to_i
txt = "" 
lines.times do
	txt += infile.readline
end
infile.close

#finding the occurance of each letter
occuranceCount = {}
txt.upcase.each_char do |x|
	if ('A' .. 'Z') === x
		if occuranceCount[x] == nil
			occuranceCount[x] = 0
		end
		occuranceCount[x] += 1
	end
end

#processing the output
outfile = File.open("./output.txt","w")
occuranceCount.to_a.sort_by{|e| e[1]}.reverse.collect { |e,n| outfile.puts(e + " " + n.to_s) }
outfile.close
