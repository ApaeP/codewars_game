class ApiFetcherWorker < ActiveJob::Base
  queue_as :default

  def perform(user)
    data = ApiManager.new(api_token: user.codewars_api_token, nickname: user.codewars_nickname).fetch_all
    data = data.first(3)

    new_solutions = []

    data.each do |data_input|
      kata = Kata.find_by(codewars_id: data_input["id"]) || Kata.create(codewars_id: data_input["id"])
      data_input["completedLanguages"].each do |language|
        if Solution.find_by(user: user, codewars_id: data_input["id"], language: language)&.content.nil?
          solution = Solution.find_by(user: user, codewars_id: data_input["id"], language: language) ||
                     Solution.create(user: user, kata: kata, language: language, codewars_id: data_input["id"])

          new_solutions << solution
        end
      end
    end
    new_solutions
  end
end

