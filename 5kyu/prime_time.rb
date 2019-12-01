# We need prime numbers and we need them now!
#
# Write a method that takes a maximum bound and returns all primes up to and including the maximum bound.
#
# For example:
#
# prime(11)
# Should return an array that looks like this:
#
# [2, 3, 5, 7, 11]

require 'prime'

def prime(n)
  arr = []
  return arr if n == 0 || n == 1

  Prime.each(n) do |prime|
  arr << prime
  end
end

#best practice
# require 'prime'
#
# def prime(n)
#   Prime.take_while { |p| p <= n }
# end
