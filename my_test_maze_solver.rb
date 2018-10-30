require 'test/unit'
require './MazeLoader.rb'
require './MazeSolver.rb'

class MyTestMazeSolver < Test::Unit::TestCase

# Feasible is a maze that has at least one solution
# Non-feasible is a maze that has no solution foreach pair of nodes

  def setup
    @maze = MazeLoader.new
    @mazeSolver= MazeSolver.new
  end

  def test_noPathFoundInNonFeasibleMaze
    matrix = @maze.loadFile("./sample_noSolution")
    assert_nil(@mazeSolver.solve(matrix, 1, 1, 2, 3))

  end

  def test_PathFoundinFeasibleMaze
    matrix = @maze.loadFile("./sample")
    @path= [[1, 3], [2, 3], [2, 4], [2, 5], [2, 6], [3, 6], [4, 6], [4, 5], [4, 4], [5, 4]]
    assert_true(@mazeSolver.solve(matrix, 1, 3, 5, 4)==@path)

  end

  def test_noPathFoundInFeasibleMaze
    matrix = @maze.loadFile("./sample")
    assert_nil(@mazeSolver.solve(matrix, 1, 1, 2, 0))

  end

  def test_noPathFoundInFeasibleBiggerMaze
    matrix = @maze.loadFile("./sample_b")
    assert_not_nil(@mazeSolver.solve(matrix, 1, 3, 5, 4))

  end

end