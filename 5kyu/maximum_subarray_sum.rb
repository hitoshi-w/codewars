arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
def max_sequence(arr)
  return arr.sum if arr.all? {|p| p > 0}
  return 0 if arr.all? {|p| p < 0} || arr.empty?
  sum_arr = []
  arr.size.times do |i|
    arr.each_cons(i+1) { |k| sum_arr << k.sum }
  end
  sum_arr.max
end
