# Given an array, find the integer that appears an odd number of times.
#
# There will always be only one integer that appears an odd number of times.

def find_it(seq)
  seq.each {|s| return s if seq.count(s).odd?}
end

#best practice
def find_it(seq)
  seq.detect { |n| seq.count(n).odd? }
end
