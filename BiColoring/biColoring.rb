require 'thread'

class Graph

	def initialize(graph)
		@graph = graph
	end

	def bfs(startnode) # function to find bi-colorable or not
		a = Array.new
		a[startnode] = "w"
		queue = Queue.new
		queue.push(startnode)
		while !(queue.empty?)
			node = queue.pop
			@graph[node].each do |x|
				if a[node] == "w" && a[x] == nil
					a[x] = "b"
				elsif a[node] == "w" && a[x] == "b"
					break;
				elsif a[node] == "b" && a[x] == nil
					a[x] = "w"
				elsif a[node] == "b" && a[x] == "w"
					break;
				else
					return "NOT BICOLORABLE"
				end
				queue.push(x)
			end
		end
		"BICOLORABLE"
	end
end

# processing the input
infile = File.open("./input.txt")
nodes = infile.readline.to_i
edges = infile.readline.to_i
graph = Hash.new
nodes.times do |i|
	graph[i] = []
end
while !(infile.eof?)
 	a = infile.readline.split
	graph[a[0].to_i].push(a[1].to_i)
end
infile.close

#processing the output
mygraph = Graph.new(graph)
outfile = File.open("./output.txt","w")
outfile.write(mygraph.bfs(0))
outfile.close
