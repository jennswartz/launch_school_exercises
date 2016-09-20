def joinor(arr, punctuation=', ', conjunction='or')
  last_in_sequence = conjunction + " " + arr.last.to_s
  arr.pop
  arr.collect! { |unite| unite.to_s + punctuation }
  arr << last_in_sequence
  puts arr.join
end

joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

