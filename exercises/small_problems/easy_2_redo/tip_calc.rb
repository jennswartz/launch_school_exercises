puts "What is the bill?"
total_bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f
total_tip = (tip_percentage / 100) * total_bill

total_due = total_bill + total_tip

puts "The tip is $#{"%.2f" % tip_percentage}."
puts "The total is $#{"%.2f" % total_due}."