def reverse!(list)
  new_list = []
  until list.empty?
    last = list.last
    new_list << last
    list.pop
  end
  list.replace(new_list)
end

list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
p reverse!([]) # => []
p list == []