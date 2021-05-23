class KataBuilderWorker < ActiveJob::Base
  queue_as :default

  def perform(kata)
    url = "https://www.codewars.com/kata/#{kata.codewars_id}/train/#{kata.language}"
    p url
  end
end
