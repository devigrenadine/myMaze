# We print the maze and
# load an external .txt file to a matrix
# The format is similar to the following example,
#i.e walls are "X" and passages are "_"

# _______X
# ___XXX__
# X______X
# __XXXX__
# ___X____
# _____X__

class MazeLoader

  def loadFile (file)
    maze={}
    matrix2D=[]

    File.open(file, 'r') do |f|
      f.each_line do |line|
        puts line
        matrix2D << line.chomp.split(//)
      end
    end
    matrix2D
  end

end

