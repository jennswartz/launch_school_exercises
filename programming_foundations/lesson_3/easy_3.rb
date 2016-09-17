# Question 1
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 2
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'

# Question 3
flintstones.concat(%w(Dino Happy))

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))

# Question 5
statement = "The Flintstones Rock!"
statement.count('t')

# Question 6
title = "Flintstone Family Members"
title.center(40)