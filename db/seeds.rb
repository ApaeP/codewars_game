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
  codewars_email: ENV['CODEWARS_EMAIL'],
  codewars_password: ENV['CODEWARS_PASSWORD'],
  codewars_api_token: ENV['CODEWARS_API_TOKEN']
)

%w[Lomig Wulfens Rou97 chaymaISETCH goldangera cbw29512 Sarah soltani marwen3216 prof_noob DolgKreker darlanmendonca dnolan jkempster34 tanzeeb pedantech gdott9 owenbyrne sdanthony Darigaaz Silberbogen Insanitariume tnelson mitjok].each_with_index do |user, i|
  User.create!(
    email: "test#{i}@test.com",
    password: 'azerty',
    codewars_nickname: user,
    codewars_email: ENV['codewars_email'],
    codewars_password: ENV['codewars_password'],
    codewars_api_token: ENV['CODEWARS_API_TOKEN']
  )
end

puts "Records created"
