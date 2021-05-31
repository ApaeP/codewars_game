# Retrieves kata data from the api

class KataBuilderWorker < ActiveJob::Base
  queue_as :default

  def perform(kata)
    api_kata_url = "https://www.codewars.com/api/v1/code-challenges/#{kata.codewars_id}"
    data = ApiManager.new.fetch_challenge_infos(api_kata_url)
    data.keys.each { |key| data[key.underscore.to_sym] = data.delete(key) }
    return if data[:success] == false
    data[:codewars_id] = data[:id]
    data[:level] = data[:rank]["id"]
    data[:level_name] = data[:rank]["name"]
    data[:level_color] = data[:rank]["color"]
    data[:title] = data[:name]
    data[:created_at] = DateTime.parse(data[:created_at])
    data[:creation_date] = data[:created_at]
    %i(slug id rank name published_at approved_at created_by approved_by contributors_wanted unresolved created_at).each do |key|
      data.delete(key)
    end

    kata.update(data)
  end
end
