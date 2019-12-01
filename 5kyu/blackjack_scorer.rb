# Complete the function that determines the score of a hand in the card game Blackjack (aka 21).
#
# The function receives an array of strings that represent each card in the hand ("2", "3", ..., "10", "J", "Q", "K" or "A") and should return the score of the hand (integer).
#
# Scoring rules:
# Number cards count as their face value (2 through 10). Jack, Queen and King count as 10. An Ace can be counted as either 1 or 11.
#
# Return the highest score of the cards that is less than or equal to 21. If there is no score less than or equal to 21 return the smallest score more than 21.
#
# Examples
# ["A"]                           ==>  11
# ["A", "J"]                      ==>  21
# ["A", "10", "A"]                ==>  12
# ["5", "3", "7"]                 ==>  15
# ["5", "4", "3", "2", "A", "K"]  ==>  25

def score_hand(cards)
  ten = ['J', 'Q', 'K']
  a_ele = cards.select {|s| s == 'A'}
  non_a_ele = (cards - a_ele).map do |m|
    if ten.include?(m)
     m = 10
    else
     m.to_i
    end
  end

  a_ele.map{|m| m = 11}.inject(non_a_ele.sum) do |sum, i|
    if sum + i > 21 || ( sum + i == 21 && a_ele.size > 1 )
      sum + 1
    else
      sum + i
    end
  end
end

#best practice
def score_hand(a)
  n = a.sum{|x| x == "A" ? 11 : "JQK".include?(x) ? 10 : x.to_i}
  a.each{|x| n -= 10 if x == "A" && n > 21}
  n
end
