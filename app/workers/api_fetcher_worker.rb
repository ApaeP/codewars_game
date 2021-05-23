class ApiFetcherWorker < ActiveJob::Base
  queue_as :default

  def perform(user)
    data = ApiManager.new(api_token: user.codewars_api_token, nickname: user.codewars_nickname).fetch_all
    data.each do |kata|
      Kata.create(
                  user: user,
                  codewars_id: kata["id"],
                  # TODO
                  language: kata["completedLanguages"].first,
                  title: kata["name"]
                  )
    end
  end
end
