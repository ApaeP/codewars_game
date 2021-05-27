puts "Seeding"

puts "\nDestroy records"
Friendship.destroy_all
Solution.destroy_all
Kata.destroy_all
User.destroy_all
puts "Records destroyed"

puts "\nCreate records"
User.create!(email: 'test@test.com', password: 'azerty', codewars_nickname: 'ApaeP', codewars_api_token: 'pCaCQfbn9zyRkY6ymEWe')
puts "Records created"
