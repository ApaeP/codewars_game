class ApiFetcherWorker < ActiveJob::Base
  queue_as :default

  def perform(user)
    data = ApiManager.new(api_token: user.codewars_api_token, nickname: user.codewars_nickname).fetch_all
    data = data.first(10)

    new_solutions = []

    # for each kata solved
    data.each do |data_input|
      # finding associated kata or creating one
      kata = Kata.find_by(codewars_id: data_input["id"]) || Kata.create(codewars_id: data_input["id"])
      # for each completed language of the kata solved
      data_input["completedLanguages"].each do |language|
        if Solution.find_by(user: user, codewars_id: data_input["id"], language: language)&.content.nil?
          solution = Solution.find_by(user: user, codewars_id: data_input["id"], language: language) ||
                     Solution.create(user: user, kata: kata, language: language, codewars_id: data_input["id"])

          new_solutions << solution
        end
        # TODO add if empty
        # binding.pry
        # unless Solution.find_by(user: user, codewars_id: data_input["id"], language: language)&.content.nil?
        # end
        # next if Solution.find_by(user: user, codewars_id: data_input["id"], language: language)

        # solution = Solution.create!(user: user, kata: kata, language: language, codewars_id: data_input["id"])
        # new_solutions << solution
      end
    end
    new_solutions
  end
end

