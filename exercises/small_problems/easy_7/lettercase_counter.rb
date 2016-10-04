require 'pry'

def letter_case_count(string)
  result_hash = {}
  result_hash[:lowercase] = string.scan(/[[:lower:]]/).count
  result_hash[:uppercase] = string.scan(/[[:upper:]]/).count
  result_hash[:neither] = string.scan(/[^A-Za-z]/).count
  result_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }