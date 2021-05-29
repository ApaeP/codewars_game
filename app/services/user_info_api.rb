class UserInfoApi
  def initialize(user)
    @base_uri = URI.parse("https://www.codewars.com/api/v1/users/#{user.codewars_nickname}")
    @request_options = { use_ssl: @base_uri.scheme == "https" }

  end

  def fetch_user_infos
    request = Net::HTTP::Get.new(@base_uri)
    response = Net::HTTP.start(@base_uri.hostname, @base_uri.port, @request_options) do |http|
      http.request(request)
    end
    JSON.parse(response.body)
  end

  def user_infos
    data = fetch_user_infos
    return unless data
    data.keys.each { |key| data[key.underscore.to_sym] = data.delete(key) }
    if data[:name]
      data[:first_name] = data[:name].split.first
      data[:last_name] = data.delete(:name).split.last
    else
      data.delete(:name)
    end
    data.delete(:username)
    data.delete(:skills)
    data[:overall_rank] = data[:ranks]["overall"]["rank"]
    data[:overall_rank_name] = data[:ranks]["overall"]["name"]
    data[:overall_rank_color] = data[:ranks]["overall"]["color"]
    data[:overall_score] = data[:ranks]["overall"]["score"]
    data[:ranks].delete("overall")
    data[:language_ranks] = data[:ranks]["languages"]
    data.delete(:ranks)
    data[:katas_authored_count] = data[:code_challenges]["totalAuthored"]
    data[:katas_completed_count] = data[:code_challenges]["totalCompleted"]
    data.delete(:code_challenges)
    data
  end
end

# {
#   "username": "ApaeP",
#   "name": "Paul Portier",
#   "honor": 2060,
#   "clan": null,
#   "leaderboardPosition": 4565,
#   "skills": null,
#   "ranks": {
#       "overall": {
#           "rank": -3,
#           "name": "3 kyu",
#           "color": "blue",
#           "score": 2279
#       },
#       "languages": {
#           "ruby": {
#               "rank": -3,
#               "name": "3 kyu",
#               "color": "blue",
#               "score": 2279
#           },
#           "javascript": {
#               "rank": -8,
#               "name": "8 kyu",
#               "color": "white",
#               "score": 3
#           }
#       }
#   },
#   "codeChallenges": {
#       "totalAuthored": 0,
#       "totalCompleted": 644
#   }
# }

#  :honor=>2060,
#  :clan=>nil,
#  :leaderboard_position=>4565,
#  :first_name=>"Paul",
#  :last_name=>"Portier",
#  :overall_rank=>-3,
#  :overall_rank_name=>"3 kyu",
#  :overall_rank_color=>"blue",
#  :overall_score=>2279,
#  :language_ranks=>{"ruby"=>{"rank"=>-3, "name"=>"3 kyu", "color"=>"blue", "score"=>2279}, "javascript"=>{"rank"=>-8, "name"=>"8 kyu", "color"=>"white", "score"=>3}},
#  :katas_authored_count=>0,
#  :katas_completed_count=>644}

























