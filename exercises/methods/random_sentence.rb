def name(arr)
  arr.sample
end

def activity(arr)
  arr.sample
end

def sentence(name1, activity1)
  "#{name1} went #{activity1} today."
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
