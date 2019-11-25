def snail(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end
