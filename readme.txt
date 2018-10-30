## Read me

Maze implementation:

The maze implementation is comprised by the following classes:

->MazeLoader.rb 
	Here a file is loaded into a two-dimensional matrix via loadFile method
-> Maze.rb 
	Here we get the maze array dimensions, set arbitrarily the source and destination and call the solve method of MazeSolver class
-> MazeSolver.rb
	Contains the basic solve functionality
	A set of nodes is being created during the visit of neighbour nodes. Each time we pick one node to check its adjacent nodes. We stop when we reach the destination or when no nodes are left to be checked
	
	Unit tests:
-> my_test_maze.rb (test MazeLoader)
   Test whether the file is loaded
-> my_test_maze_solver (test MazeSolver)
	Test path solutions on 4 types of mazes
		-Non feasible solution
		- Path in sample maze 
		- Path in a bigger sample maze 
		- No path for a feasible maze
These tests do not cover all possible scenarios, serve for demonstration
	
		
References:
https://www.cs.bu.edu/teaching/alg/maze/ 
https://www.sitepoint.com/graph-algorithms-ruby/
https://rosettacode.org/wiki/Maze_solving	
https://gist.github.com/RLGGHC/272640/bf7b72305e47b15f0ae94d886eef6adac75d8bb4
	
