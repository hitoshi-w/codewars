board=[
  [5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 0, 3, 4, 8],
  [1, 0, 0, 3, 4, 2, 5, 6, 0],
  [8, 5, 9, 7, 6, 1, 0, 2, 0],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 0, 1, 5, 3, 7, 2, 1, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 0, 0, 4, 8, 1, 1, 7, 9]
]

def validSolution(board)
  m = 9
  board.all? { |x| x.uniq.length == m } &&
  board.transpose.all? { |y| y.uniq.length == m } &&
  sub_grid(board).all? { |s| p s.uniq.size == m }
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

# best practice
# def validSolution(board)
#   sudoku_sections = rows(board) + columns(board) + blocks(board)
#   sudoku_sections.all?{|section| contains_all_nine?(section)}
# end
#
# def rows(board)
#   board
# end
#
# def columns(board)
#   board.transpose
# end
#
# def blocks(board)
#   board.map{|row| row.each_slice(3).to_a}.transpose.flatten.each_slice(9).to_a
# end
#
# def contains_all_nine?(section)
#   [1,2,3,4,5,6,7,8,9].to_set == section.to_set
# end
