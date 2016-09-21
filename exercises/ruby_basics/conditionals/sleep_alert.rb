status = ['awake', 'tired'].sample

my_status = if status == 'awake'
              'Be productive!'
            else
              'Go to sleep!'
            end

puts my_status