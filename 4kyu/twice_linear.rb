# Consider a sequence u where u is defined as follows:
#
# The number u(0) = 1 is the first one in u.
# For each x in u, then y = 2 * x + 1 and z = 3 * x + 1 must be in u too.
# There are no other numbers in u.
# Ex: u = [1, 3, 4, 7, 9, 10, 13, 15, 19, 21, 22, 27, ...]
#
# 1 gives 3 and 4, then 3 gives 7 and 10, 4 gives 9 and 13, then 7 gives 15 and 22 and so on...
#
# Task:
# Given parameter n the function dbl_linear (or dblLinear...) returns the element u(n) of the ordered (with <) sequence u (so, there are no duplicates).
#
# Example:
# dbl_linear(10) should return 22

def dbl_linear(n)
  u = [1]
  x = 0
  y = 0

  for i in 0..n do
    u_x = 2 * u[x] + 1
    u_y = 3 * u[y] + 1
    if u_x <= u_y
      u[i+1] = u_x
      x += 1
      y += 1 if u_x == u_y
    else
      u[i+1] = u_y
      y += 1
    end
  end
  u[n]
end

#best practice
def dbl_linear(n)
    h = 1; cnt = 0; q2, q3 = [], []
    while true do
        if (cnt >= n) then
            return h
        end
        q2.push(2 * h + 1)
        q3.push(3 * h + 1)
        h = [q2[0], q3[0]].min
        if h == q2[0] then h = q2.shift() end
        if h == q3[0] then h = q3.shift() end
        cnt += 1
    end
end
