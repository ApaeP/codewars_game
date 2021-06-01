puts "Seeding"

puts "\nDestroy records"
Friendship.destroy_all
Solution.destroy_all
Kata.destroy_all
User.destroy_all
puts "Records destroyed"

puts "\nCreate records"

puts "\nCreate users"
User.create!(
  email: 'test@test.com',
  password: 'azerty',
  codewars_nickname: 'ApaeP',
  codewars_email: 'paulportier@gmail.com',
  codewars_password: 'antalpol8221',
  codewars_api_token: 'lolzzzzzzzzzzzzzzzzz')
  # codewars_api_token: 'pCaCQfbn9zyRkY6ymEWe')
User.create!(
  email: "test1@test1.com",
  password: 'azerty',
  codewars_api_token: 'lolzzzzzzzzzzzzzzzzz',
  # codewars_api_token: 'PCaCQfbn9zyRkY6ymEWe',
  codewars_nickname: "Wulfens",
)
User.create!(
  email: "test2@test2.com",
  password: 'azerty',
  # codewars_api_token: 'zCaCQfbn9zyRkY6ymEWe',
  codewars_api_token: 'lolzzzzzzzzzzzzzzzzz',
  codewars_nickname: "Lomig",
)
puts "Records created"
