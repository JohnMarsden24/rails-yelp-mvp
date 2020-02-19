categories = ["chinese", "italian", "japanese", "french", "belgian"]

5.times do
  Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.phone_number, category: categories.sample )
end
