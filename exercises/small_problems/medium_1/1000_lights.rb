def lights(num)
  on = (1..num).to_a
  off = on.select { |number| number % 2 == 0 }
  on = on.reject { |number| number % 2 == 0 }
  counter = 3
  (num - 2).times do
    turn_these_on = off.select { |number| number % counter == 0 }
    turn_these_off = on.select { |number| number % counter == 0 }
    off = off + turn_these_off
    off.sort!
    on = on + turn_these_on
    on.sort!
    counter += 1
  end
  puts "This is on: #{on}. This is off #{off}"
end

lights(5)
lights(10)