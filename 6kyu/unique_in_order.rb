# Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.
#
# For example:
#
# unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
# unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
# unique_in_order([1,2,2,3,3])       == [1,2,3]

def unique_in_order(iterable)
  return [] if iterable.empty?

  arr = [iterable[0]]
  for i in 1..iterable.size-1
    unless arr.last == iterable[i]
      arr.push(iterable[i])
    end
  end
  arr
end

#bestpractice
def unique_in_order(iterable)
  result =[]
  for i in 0..(iterable.length-1)
    result << iterable[i] if iterable[i] != iterable[i+1]
  end
  result
end
