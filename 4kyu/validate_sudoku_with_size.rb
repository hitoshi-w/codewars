# Given a Sudoku data structure with size NxN, N > 0 and √N == integer, write a method to validate if it has been filled out correctly.
#
# The data structure is a multi-dimensional Array(in Rust: Vec<Vec<u32>>) , ie:
#
# [
#   [7,8,4,  1,5,9,  3,2,6],
#   [5,3,9,  6,7,2,  8,4,1],
#   [6,1,2,  4,3,8,  7,5,9],
#
#   [9,2,8,  7,1,5,  4,6,3],
#   [3,5,7,  8,4,6,  1,9,2],
#   [4,6,1,  9,2,3,  5,8,7],
#
#   [8,7,6,  3,9,4,  2,1,5],
#   [2,4,3,  5,6,1,  9,7,8],
#   [1,9,5,  2,8,7,  6,3,4]
# ]
# Rules for validation
#
# Data structure dimension: NxN where N > 0 and √N == integer
# Rows may only contain integers: 1..N (N included)
# Columns may only contain integers: 1..N (N included)
# 'Little squares' (3x3 in example above) may also only contain integers: 1..N (N included)

require 'set'
class Sudoku
  def initialize(data)
    @data = data
    @sub_data_size = Math.sqrt(@data.size)
  end

  def valid?
    if square?
      section = @data + @data.transpose + blocks
      section.all?{|row| includes_all_num?(row)}
    else
      false
    end
  end

  def blocks
    k = @sub_data_size.to_i
    @data.map{|row| row.each_slice(k).to_a}.transpose.flatten.each_slice(k*k).to_a
  end

  def includes_all_num?(row)
    (1..@data.size).to_a.to_set == row.to_set
  end

  def square?
    @sub_data_size.to_s.match?(/^[0-9]+.0$/) &&
    @data.size == @data[0].size
  end
end

#best practice
class Sudoku

  def initialize(data)
    @sudoku = data
  end

  def valid?
    return false if @sudoku.map{ |a| a.count }.uniq.count != 1 || @sudoku.count == 1 && @sudoku.first.first != 1
    i = 0
    while i < @sudoku.count do
      return false if @sudoku[i].uniq.count != @sudoku[i].count || @sudoku[i].include?(0)
      i += 1
    end
    if @sudoku.count == 9
      return false if @sudoku.first.slice(0,3).concat(@sudoku[1].slice(0,3), @sudoku[2].slice(0,3)).uniq.count < 9
    end
    true
  end
end
