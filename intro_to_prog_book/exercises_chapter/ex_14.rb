contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]

contacts = {"Joe Smith" => {}}

headers = [:email, :address, :phone]


contacts.each do |key, value|
  headers.each do |header|
    value[header] = contact_data.shift
  end
end


p contacts
