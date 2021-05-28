class ApiFetcherWorker < ActiveJob::Base
  queue_as :default

  def perform(user)
    data = ApiManager.new(api_token: user.codewars_api_token, nickname: user.codewars_nickname).fetch_all
    data.reject! { |hsh| user.solutions.pluck(:codewars_id).include?( hsh["id"]) }
    # data.reject! { |hsh| Kata.all.pluck(:codewars_id).include?( hsh["id"]) }

    data.each do |kata|
      xkata = Kata.find_by(codewars_id: kata["id"]) ||
              Kata.create(codewars_id: kata["id"])

      Solution.create!(user: user, kata: xkata, languages: kata["completedLanguages"], codewars_id: kata["id"])
    end
  end
end
