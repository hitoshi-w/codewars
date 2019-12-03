# Write a function that calculates the least common multiple of its arguments; each argument is assumed to be a non-negative integer. In the case that there are no arguments (or the provided array in compiled languages is empty), return 1.

def lcm(*arg)
 arg.empty? ? 1 : arg.reduce(:lcm)
end
