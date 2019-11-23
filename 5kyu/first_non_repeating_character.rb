def first_non_repeating_char(s)
  s_downcase = s.downcase
  s_uniq = s_downcase.chars.uniq

  if s_uniq.all? {|l| s_downcase.count > 1} || s == ''
    non_repeat = ''
  else
    non_repeat = s_uniq.select { |l| s_downcase.count(l) == 1 }.first
    s.include?( non_repeat) ? non_repeat : non_repeat.upcase
  end
end

# best practice
def first_non_repeating_char(s)
  s.chars.find {|i| s.downcase.count(i)==1 || s.upcase.count(i)==1} || ""
end
