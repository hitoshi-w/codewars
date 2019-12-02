def lcm(*arg)
 arg.empty? ? 1 : arg.reduce(:lcm)
end
