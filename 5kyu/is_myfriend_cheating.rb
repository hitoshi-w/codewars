# A friend of mine takes a sequence of numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers in the sequence, excluding a and b.
# Given a number n, could you tell me the numbers he excluded from the sequence?
# The function takes the parameter: n (n is always strictly greater than 0) and returns an array or a string (depending on the language) of the form:
#
# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]
# with all (a, b) which are the possible removed numbers in the sequence 1 to n.
#
# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ...will be sorted in increasing order of the "a".
#
# It happens that there are several possible (a, b). The function returns an empty array (or an empty string) if no possible numbers are found which will prove that my friend has not told the truth! (Go: in this case return nil).

def removNb(n)
  sum = (n*(n+1))/2
  result = []
  for b in 1..n do
    a = (sum-b)/(b+1).to_f
    if(a < n && /^[0-9]+\.0$/ =~ a.to_s)
      result.push([b, a.to_i])
    end
  end
  return result
end

#best practice
# generate a range from 1 to n
# use an iterator/each over the range we generated to get our first number
# nest an iterator over range move the number up to get every possible number of pairs
# while inside second iterator, we are going to remove the two numbers from the array
# sum the resulting number test for equality under two numbers
# append to some sort of results array

# total = (n*n + n) /2
# (total - a - b) = ab
# (total - a) = ab + b = b(a+1)
# ((total - a) / (a+1)) = b
def removNb(n)
  res = []
  total = (n*n + n) / 2
  range = (1..n)

  (1..n).each do |a|
    b = ((total - a) / (a * 1.0 + 1.0))
     if b == b.to_i && b <= n
      res.push([a,b.to_i])

    end
  end
  return res
end
