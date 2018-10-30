class MazeSolver
  # Solve via breadth-first algorithm.
  # General idea is to insert discovered nodes into a setOfNodes,
  # pull the last each time and discover its neighbourhood.


  DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1]]


  def solve(array, start_x, start_y, end_x, end_y)

    # Get x,y dimensions
    @upper_limit_x=array.size
    @upper_limit_y=array[0].size
    @start_x=start_x
    @start_y=start_y
    @end_x=end_x
    @end_y=end_y

    # Initialize the checked array needed to track whether a node is already visited
    # This serves for less checks in adjacent nodes
    @visited= Array.new(@upper_limit_x) { Array.new(@upper_limit_y) }


    # Initialize path and setOfNodes
    # @setOfNodes serves for storing discovered nodes and for backtracking
    # It also serves caching, no need to rebuild every time an existing path
    # path (if any) is the solution path or nil if there is no path

    @setOfNodes = []
    path=nil

    # The first node to visit should be the starting node
    visit_node([], @start_x, @start_y)

    #Discover nodes until a path is found or until there are no left nodes to discover
    until @setOfNodes.empty? || path
      path = check_neighbour(array)
    end

    # We are done , result is presented
    if path
      print 'The path is: '+ "#{path}"
      path
    else
      puts "No solution found!"
      nil
    end

  end

  private

  # Maze solving visiting method.
  # Here we perform the basic functionality

  def check_neighbour(array)
    # Get the next node

    path = @setOfNodes.shift

    # We take last node to discover its neighbourhood
    x, y = path.last

    # Mark node as visited
    @visited[x][y]=1

    # The path is complete if we reach the end node
    return path if x == @end_x && y == @end_y


    for dx, dy in DIRECTIONS

      if dx.nonzero?
        # Move North / South
        new_x = x + dx

        # If we can move to a not visited adjacent node it should be inserted into the setOfNodes

        if new_x >=0 && new_x<=@upper_limit_x-1 && array[new_x].at(y)=="_" && !@visited[new_x][y]
          visit_node(path, new_x, y)
        end
      else

        # Move West / East
        new_y = y + dy

        # Same as above
        if new_y >=0 && new_y <= @upper_limit_y-1 && array[x].at(new_y)=="_" && !@visited[x][new_y]
          visit_node(path, x, new_y)
        end
      end
    end
    nil
  end


  # Insert a new node to the setOfNodes
  def visit_node(path, x, y)
    @setOfNodes << path + [[x, y]]
  end
end