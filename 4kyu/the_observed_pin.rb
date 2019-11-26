# Alright, detective, one of our colleagues successfully observed our target person, Robby the robber. We followed him to a secret warehouse, where we assume to find all the stolen stuff. The door to this warehouse is secured by an electronic combination lock. Unfortunately our spy isn't sure about the PIN he saw, when Robby entered it.
#
# The keypad has the following layout:
#
# ┌───┬───┬───┐
# │ 1 │ 2 │ 3 │
# ├───┼───┼───┤
# │ 4 │ 5 │ 6 │
# ├───┼───┼───┤
# │ 7 │ 8 │ 9 │
# └───┼───┼───┘
#     │ 0 │
#     └───┘
# He noted the PIN 1357, but he also said, it is possible that each of the digits he saw could actually be another adjacent digit (horizontally or vertically, but not diagonally). E.g. instead of the 1 it could also be the 2 or 4. And instead of the 5 it could also be the 2, 4, 6 or 8.
#
# He also mentioned, he knows this kind of locks. You can enter an unlimited amount of wrong PINs, they never finally lock the system or sound the alarm. That's why we can try out all possible (*) variations.

def get_pins(input)
  data = {
    1 => [1, 2, 4],
    2 => [2, 1, 3, 5],
    3 => [3, 2, 6],
    4 => [4, 1, 7, 5],
    5 => [5, 4, 2, 6, 8],
    6 => [6, 3, 5, 9],
    7 => [7, 4, 8],
    8 => [8, 7, 5, 9, 0],
    9 => [9, 6, 8],
    0 => [0, 8],
  }

  input_len = input.chars.size
  input_arr = input.chars.map{ |a| data[a.to_i] }
  return input_arr[0].map(&:to_s) if input_len == 1

  r = input_arr[0]
  for index in 1..input_len - 1 do
    r = r.product(input_arr[index])
  end
