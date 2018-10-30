require './MazeLoader.rb'
require 'test/unit'

class MyTestMaze < Test::Unit::TestCase

  def setup
    @maze = MazeLoader.new
  end

  def test_fileLoadedProperly
    matrix = @maze.loadFile("./sample")
    assert_equal(matrix.size, 7)
  end

  def test_fileEmpty
    matrix = @maze.loadFile("./sample_noMaze")
    assert_equal(matrix.size, 0)
  end

end