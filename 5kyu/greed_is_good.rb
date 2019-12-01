# Greed is a dice game played with five six-sided dice. Your mission, should you choose to accept it, is to score a throw according to these rules. You will always be given an array with five six-sided dice values.
#
#  Three 1's => 1000 points
#  Three 6's =>  600 points
#  Three 5's =>  500 points
#  Three 4's =>  400 points
#  Three 3's =>  300 points
#  Three 2's =>  200 points
#  One   1   =>  100 points
#  One   5   =>   50 point
# A single die can only be counted once in each roll. For example, a "5" can only count as part of a triplet (contributing to the 500 points) or as a single 50 points, but not both in the same roll.
#
# Example scoring
#
#  Throw       Score
#  ---------   ------------------
#  5 1 3 4 1   50 + 2 * 100 = 250
#  1 1 1 3 1   1000 + 100 = 1100
#  2 4 4 5 4   400 + 50 = 450

def score( dice )
  total = []
  one_and_five = [[1000, 100], [500, 50]]
  [1, 5].each_with_index do |e, i|
    arr_size = dice.select {|s| s == e}.size
      if arr_size > 0
        if arr_size == 3
          total << one_and_five[i][0]
        elsif arr_size < 3
          total << one_and_five[i][1] * arr_size
        else
          total << one_and_five[i][1] * (arr_size - 3) + one_and_five[i][0]
        end
      end
  end
  [2, 3, 4, 6].each do |e|
    total << e * 100 if dice.join.count(e.to_s) >= 3
  end
  total.sum
end

#best practice
SCORE_MAP = {
  1 => [0, 100, 200, 1000, 1100, 1200, 2000],
  2 => [0, 0, 0, 200, 200, 200, 400],
  3 => [0, 0, 0, 300, 300, 300, 600],
  4 => [0, 0, 0, 400, 400, 400, 800],
  5 => [0, 50, 100, 500, 550, 600, 1000],
  6 => [0, 0, 0, 600, 600, 600, 1200]
}

def score( dice )
  (1..6).inject(0) do |score, die|
    score += SCORE_MAP[die][dice.count(die)]
  end
end
