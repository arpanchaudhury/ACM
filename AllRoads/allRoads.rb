def floyd_warshall(dist,size) # finding all pair shortest path
	for k in (1 .. size) do
		for i in (1 .. size) do
			for j in (1 .. size) do
				if dist[i-1][k-1] + dist[k-1][j-1] < dist[i-1][j-1] 
					dist[i-1][j-1] = dist[i-1][k-1] + dist[k-1][j-1]
				end
			end
		end
	end
	dist
end

# processing input file 
infile = File.open("./input.txt")
lines = infile.readlines.collect { |x| x.chomp }
infile.close
map = {}
count = 0
edgeCount = lines[0].split[0].to_i
(1 .. edgeCount).each do |x|
	nodes = lines[x].split
	if map[nodes[0]] == nil
		map[nodes[0]] = count
		count += 1
	end
	if map[nodes[1]] == nil
		map[nodes[1]] = count
		count += 1
	end
end
dist = Array.new(map.length) { Array.new(map.length) }
for i in (1 .. map.length) do
	for j in (1 .. map.length) do
		if i == j
			dist[i-1][j-1] = 0
		elsif
			dist[i-1][j-1] = 999999
		end
	end
end
(1 .. edgeCount).each do |x|
	nodes = lines[x].split
	dist[map[nodes[0]]][map[nodes[1]]] = 1
	dist[map[nodes[1]]][map[nodes[0]]] = 1
end

# processing output file
dist = floyd_warshall(dist,map.length)
outfile = File.open("./output.txt","w")
((edgeCount+1) .. (lines.size-1)).each do |x|
	query = lines[x].split
	outfile.puts(dist[map[query[0]]][map[query[1]]])
end
outfile.close

