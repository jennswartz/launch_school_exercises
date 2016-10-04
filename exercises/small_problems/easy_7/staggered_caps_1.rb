def staggered_case(string)
  staggered = string.chars.map.with_index do |element, index|
    if index.even?
      element.capitalize
    else
      element.downcase
    end
  end
  staggered.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'