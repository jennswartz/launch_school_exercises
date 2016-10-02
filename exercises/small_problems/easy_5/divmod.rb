# def make_change r, notes = [50,20,10,5,1]
#   notes.map do |c|
#     q, r = r.divmod c
#     q
#   end
# end

# p make_change(105)

def divmod(num1, num2)
  quotient, remainder = num1.divmod(num2)
  puts "quotient is #{quotient} remainder is #{remainder}"
end

p divmod(55, 11)