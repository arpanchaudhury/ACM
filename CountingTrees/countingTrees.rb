def fact(n)
	if n == 0
		return 1
	elsif n == 1
		return 1
	else
		return n * fact(n -1)
	end
end

def treeCount(noOfNodes)	
	memoizer = {}
	if noOfNodes == 0
		return 1
	elsif noOfNodes == 1
		return 1
	else
		count = 0
		(1 .. noOfNodes).each do |x|
			if memoizer[x-1] == nil
				memoizer[x-1] = treeCount(x - 1)
			end
			if memoizer[noOfNodes-x] == nil
				memoizer[noOfNodes-x] = treeCount(noOfNodes - x)
			end
			count += memoizer[x-1] * memoizer[noOfNodes-x]
		end
		return count
	end
end

infile = File.open("./input.txt")
noOfNodes = infile.readline.to_i
infile.close

outfile = File.open("./output.txt","w")
outfile.write(fact(noOfNodes) * treeCount(noOfNodes))
outfile.close
