class KataBuilderWorker < ActiveJob::Base
  queue_as :default

  def perform(kata)
    challenge_infos_url = "https://www.codewars.com/api/v1/code-challenges/#{kata.codewars_id}"
    data = ApiManager.new.fetch_challenge_infos(challenge_infos_url)

    if kata.update(challenge_infos: data)
      kata.update(built: true)
    end
    # url = "https://www.codewars.com/kata/#{kata.codewars_id}/train/#{kata.language}"
    # puts "\n\n\n#{data}\n\n\n"
  end
end
