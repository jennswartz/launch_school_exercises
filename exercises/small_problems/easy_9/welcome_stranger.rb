def greetings(array, hash)
  name = array.join(' ')
  puts "=> Hello, #{name}. Nice to have a #{hash[:title]} " \
       "#{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })