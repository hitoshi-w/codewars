# Sudoku is a game played on a 9x9 grid. The goal of the game is to fill all cells of the grid with digits from 1 to 9, so that each column, each row, and each of the nine 3x3 sub-grids (also known as blocks) contain all of the digits from 1 to 9.
# (More info at: http://en.wikipedia.org/wiki/Sudoku)
#
# Sudoku Solution Validator
# Write a function validSolution/ValidateSolution/valid_solution() that accepts a 2D array representing a Sudoku board, and returns true if it is a valid solution, or false otherwise. The cells of the sudoku board may also contain 0's, which will represent empty cells. Boards containing one or more zeroes are considered to be invalid solutions.
#
# The board is always 9 cells by 9 cells, and every cell only contains integers from 0 to 9.
#
# Examples
# validSolution([
#   [5, 3, 4, 6, 7, 8, 9, 1, 2],
#   [6, 7, 2, 1, 9, 5, 3, 4, 8],
#   [1, 9, 8, 3, 4, 2, 5, 6, 7],
#   [8, 5, 9, 7, 6, 1, 4, 2, 3],
#   [4, 2, 6, 8, 5, 3, 7, 9, 1],
#   [7, 1, 3, 9, 2, 4, 8, 5, 6],
#   [9, 6, 1, 5, 3, 7, 2, 8, 4],
#   [2, 8, 7, 4, 1, 9, 6, 3, 5],
#   [3, 4, 5, 2, 8, 6, 1, 7, 9]
# ]); // => true
# validSolution([
#   [5, 3, 4, 6, 7, 8, 9, 1, 2],
#   [6, 7, 2, 1, 9, 0, 3, 4, 8],
#   [1, 0, 0, 3, 4, 2, 5, 6, 0],
#   [8, 5, 9, 7, 6, 1, 0, 2, 0],
#   [4, 2, 6, 8, 5, 3, 7, 9, 1],
#   [7, 1, 3, 9, 2, 4, 8, 5, 6],
#   [9, 0, 1, 5, 3, 7, 2, 1, 4],
#   [2, 8, 7, 4, 1, 9, 6, 3, 5],
#   [3, 0, 0, 4, 8, 1, 1, 7, 9]
# ]); // => false

def validSolution(board)
  m = 9
  board.all? { |x| x.uniq.length == m } &&
  board.transpose.all? { |y| y.uniq.length == m } &&
  sub_grid(board).all? { |s| s.uniq.length == m }
end

def sub_grid(board)
  k = 3
  sub = []
  k.times do |x|
    y = board[x*k..x*k+2]
    k.times do |z|
      sub << y.transpose[z*k..z*k+2].flatten
    end
  end
  sub
end

#best practice
def validSolution(board)
  sudoku_sections = rows(board) + columns(board) + blocks(board)
  sudoku_sections.all?{|section| contains_all_nine?(section)}
end

def rows(board)
  board
end

def columns(board)
  board.transpose
end

def blocks(board)
  board.map{|row| row.each_slice(3).to_a}.transpose.flatten.each_slice(9).to_a
end

def contains_all_nine?(section)
  [1,2,3,4,5,6,7,8,9].to_set == section.to_set
end
