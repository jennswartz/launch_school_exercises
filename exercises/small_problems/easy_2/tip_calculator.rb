puts "What is the bill?"
bill = gets.chomp
bill = bill.to_f

puts "What is the tip percentage?"
tip = gets.chomp
tip = tip.to_f

total_tip = (bill * (tip / 100)).round(2)
total_bill = (bill + total_tip).round(2)

puts "The tip is $#{sprintf('%.2f', total_tip)}"
puts "The total bill is $#{sprintf('%.2f', total_bill)}"