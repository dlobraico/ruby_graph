require "set"

class Graph
    def initialize(vertices=[], edges=[]) # constructor method for a graph
        @vertices = Hash.new(0)
        vertices.each { |v| add_vertex(v) }

        @edges = Hash.new(0)
        edges.each { |e| add_edge(*e) }
    end

    def [](v,w)
        return @edges[v][w]
    end

    def []=(v,w,value=1)
        add_vertex(v)
        add_vertex(w)

        @edges[v] = Hash.new(0) unless @edges.has_key? v
        @edges[w] = Hash.new(0) unless @edges.has_key? w

        @edges[v][w] = value 
        @edges[w][v] = value 
    end

    def each_vertex(&blk) # iterator for vertices
        @vertices.each do |v,n|
            blk.call(v)
        end
    end

    def each_edge(uniq=false, &blk) # iterator for edges
        @edges.each do |v|
            v.each do |w|
                blk.call(v, w) if !uniq || vertex_label(v) <= vertex_label(w)
            end
        end
    end

    def add_edge(v, w) # add an edge to a graph
        self[v,w]= 1
    end

    def delete_edge(v, w) # remove an edge from a graph
        @edges[v][w] = 0
        @edges[w][v] = 0
    end

    def add_vertex(v) # add a vertex to a graph
        @vertices[v]= v
    end

    def delete_vertex(v) # remove a vertex from a graph
        @vertices.delete(v)
    end

    def vertex_label(v) # check the vertex label
        return @vertices[v]
    end

    def adjacent?(v, w) # check if two vertices are adjacent
        return self[v, w] != 0
    end

    def vertices # return all vertices
        result= []
        each_vertex do |v|
            result.push(v)
        end
        return result
    end

    def edges(uniq= false) # return all edges
        result= []
        each_edge(uniq) do |e|
            result.push(e)
        end
        return result
    end

    def each_successing_vertex(v, &blk) # iterator for adjacent vertices, useful for moving through cycles
        each_vertex do |w|
            blk.call(w) if adjacent?(v, w)
        end
    end

    def adjacency_matrix # return the adjacency matrix of a graph
        result = []
        each_vertex do |v|
            row = []
            each_vertex do |w|
                if adjacent?(v, w)
                    row << 1
                else 
                    row << 0
                end
            end
            result << row
        end

        return result
    end

    def to_s # pretty print a graph object by showing its adjacency matrix
        adjacency_matrix.each do |row|
            row.each do |v|
                print "#{v} "
            end
            puts
        end
    end

    def isomorphic?(graph) # check if two graphs are isomorphic
        # if the two graphs have a different number of vertices or edges, return false immediately
        unless (self.vertices.size == graph.vertices.size) and (self.edges.size == graph.edges.size) 
            return 0
        end

        list = Graph.degree_to_list(self.adjacency_matrix.size)
        # if the two graphs have identical adjacency matrices, they are isomorphic
        if self.adjacency_matrix == graph.adjacency_matrix
            print list.flatten.map{|a| a + 1}.join(','); puts
            return 1
        else 
            # otherwise, we enter the worst case scenario: for each permutation of degree n (where n is the number of vertices of the graph) apply the permutation to the graph and check if the adjacency matrices are identical
            Graph.each_permutation(list) do |p|
                if graph.adjacency_matrix == self.apply_permutation(p.flatten)
                    print p.flatten.map{|a| a + 1}.join(','); puts
                    return 1
                end
            end
            return 0 # if nothing else was true, return false
        end
    end

    def apply_permutation(perm) # helper method to apply a permutation to a graph
        orig = self.adjacency_matrix
        orig2 = self.adjacency_matrix

        result = Array.new(orig.size)
        perm.each_with_index do |r, i| # permute the rows
            result[i] = orig[r].dup
            perm.each_with_index do |c, j| # permute the columns
                result[i][j] = orig[r][c]
            end
        end

        return result
    end

    def self.degree_to_list(deg) # convert a degree (integer) to a list
        result = (0..(deg-1)).to_a
        return result
    end

    def self.each_permutation(list) # iterate through permutations of a given array
        if list.length < 2
            yield list
        else
            list.each do |e|
                each_permutation(list.select() {|n| n != e}) {|val| yield([e] << val)}
            end
        end
    end

    def self.permutation_to_matrix(permutation) # convert a permutation in array form to a matrix
        result = Array.new(permutation.size)
        permutation.each_with_index do |p, i|
            result[i] = Array.new(permutation.size, 0)
            result[i][p] = 1
        end
        return result
    end

    #TODO add some error checking and make sure matrix is square
    def self.adjacency_matrix_to_graph(matrix) # helper method to convert an adjacency matrix to a graph
        g = Graph.new
        rows = matrix.size
        rows.times { |i| g.add_vertex(i) }
        matrix.each_with_index do |row, i|
            row.each_with_index do |col, j|
                if col == 1
                    g.add_edge(i,j)
                end
            end
        end
        return g 
    end

    def self.file_to_adjacency_matrix(file_path) # helper method to scan a file and convert it to an adjacency matrix
        file = File.open(file_path)
        result = []
        file.each_line do |line|
            row = []
            line.split(' ').each do |char|
                row << char.to_i
            end
            result << row
        end
        result
    end
end
