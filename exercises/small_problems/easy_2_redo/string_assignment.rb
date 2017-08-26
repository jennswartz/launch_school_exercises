name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# save_name is pointing to 'Bob'
# name is also pointing to 'Bob'
# upcase! is a destructive method call.  name is now pointing to 'BOB'
# and save_name is pointing to the same object.