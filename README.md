ruby\_graph
==========

ruby\_graph is a simply graph library written in Ruby. At this point, its main purpose is whether two graphs are isomorphic. To this end, the gem includes two command-line executables, `isomorphism` and `permutations`. `isomorphism` expects two arguments, each a path to a text file containing space and line delimited adjacency matrices for graphs. Output is the permutation functioning as an isomorphism between the two graphs if they are isomorphic, followed by a 1. If they are not isomorphic, output is simply a 0. For example:

file_1
1 0 0
0 1 0
0 0 0

file_2
1 0 0
0 1 0
0 0 0

`isomorphism file_1 file_2`

output
1,2,3
1

The `permutations` command takes an integer n and returns all of the permutations of degree n. For example, `permutations n` returns:

1 2 3 
1 3 2 
2 1 3
3 2 1
2 3 1
3 1 2

Finally, the library includes a Graph class that can be used as a basic data structure for describing simple graphs. Take a look at `lib/ruby_graph/graph.rb` for details.

Contributing to ruby\_graph
--------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Dominick LoBraico. See LICENSE.txt for
further details.

