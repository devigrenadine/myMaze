require "./MazeSolver"
require "./MazeLoader"

class Maze
# Load the file into a 2-d array
  maze = MazeLoader.new
  mazeSolution=MazeSolver.new
  matrix2D=maze.loadFile("./sample")

# Discover the given array dimensions
  @upper_limit_x=matrix2D.size
  @upper_limit_y=matrix2D[0].size

# Set arbitrary starting and ending points within range, make sure they do not coincide
  loop do
    @start_x=rand(0..@upper_limit_x-1)
    @start_y=rand(0..@upper_limit_y-1)

    @end_x= rand(0..@upper_limit_x-1)
    @end_y= rand(0..@upper_limit_y-1)

    if (@start_x!=@end_x) && (@start_y!=@end_y)
      break
    end
  end

  # We print the source and destination and call the solve method of MazeSolver
  puts "We want to go from (#{@start_x},#{@start_y}) to (#{@end_x},#{@end_y})"
  mazeSolution.solve(matrix2D, @start_x, @start_y, @end_x, @end_y)

end