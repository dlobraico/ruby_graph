require "set"

class Graph
    def initialize(vertices=[], edges=[])
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

    def each_vertex(&blk)
        @vertices.each do |v,n|
            blk.call(v)
        end
    end

    def each_edge(uniq=false, &blk)
        @edges.each do |v|
            v.each do |w|
                blk.call(v, w) if !uniq || vertex_label(v) <= vertex_label(w)
            end
        end
    end

    def add_edge(v, w)
        self[v,w]= 1
    end

    def delete_edge(v, w)
        @edges[v][w] = 0
        @edges[w][v] = 0
    end

    def add_vertex(v)
        @vertices[v]= v
    end

    def delete_vertex(v)
        @vertices.delete(v)
    end

    def vertex_label(v)
        return @vertices[v]
    end

    def adjacent?(v, w)
        return self[v, w] != 0
    end

    def vertices
        result= []
        each_vertex do |v|
            result.push(v)
        end
        return result
    end

    def edges(uniq= false)
        result= []
        each_edge(uniq) do |e|
            result.push(e)
        end
        return result
    end

    def each_successing_vertex(v, &blk)
        each_vertex do |w|
            blk.call(w) if adjacent?(v, w)
        end
    end

    def adjacency_matrix
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

    def to_s
        adjacency_matrix.each do |row|
            row.each do |v|
                print "#{v} "
            end
            puts
        end
    end

    #TODO give one exit point; write improved version
    def isomorphic?(graph)
        list = Graph.degree_to_list(self.adjacency_matrix.size)
        if self.adjacency_matrix == graph.adjacency_matrix
            return 1
        else 
            Graph.each_permutation(list) do |p|
                if graph.adjacency_matrix == self.apply_permutation(p.flatten)
                    print p.flatten.map{|a| a + 1}.join(','); puts
                    return 1
                end
            end
            return 0
        end
    end

    def apply_permutation(perm)
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

    def self.degree_to_list(deg)
        result = (0..(deg-1)).to_a
        return result
    end

    def self.each_permutation(list)
        if list.length < 2
            yield list
        else
            list.each do |e|
                each_permutation(list.select() {|n| n != e}) {|val| yield([e] << val)}
            end
        end
    end

    def self.permutation_to_matrix(permutation)
        result = Array.new(permutation.size)
        permutation.each_with_index do |p, i|
            result[i] = Array.new(permutation.size, 0)
            result[i][p] = 1
        end
        return result
    end

    #TODO add some error checking and make sure matrix is square
    def self.adjacency_matrix_to_graph(matrix)
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

    def self.file_to_adjacency_matrix(file_path)
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
