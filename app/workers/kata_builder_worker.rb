class KataBuilderWorker < ActiveJob::Base
  queue_as :default

  def perform(kata)
    challenge_infos_url = "https://www.codewars.com/api/v1/code-challenges/#{kata.codewars_id}"
    data = ApiManager.new.fetch_challenge_infos(challenge_infos_url)
    data.keys.each { |key| data[key.underscore.to_sym] = data.delete(key) }
    return if data[:success] == false
    data[:codewars_id] = data.delete(:id)
    # data[:rank].keys.each { |key| data[:rank][key.underscore.to_sym] = data[:rank].delete(key) }

    data[:level] = data[:rank]["id"]
    data[:level_name] = data[:rank]["name"]
    data[:level_color] = data[:rank]["color"]
    data.delete(:rank)
    data[:title] = data.delete(:name)
    data[:created_at] = DateTime.parse(data[:created_at])
    data[:creation_date] = data.delete(:created_at)
    %i(slug published_at approved_at created_by approved_by contributors_wanted unresolved).each do |key|
      data.delete(key)
    end

    kata.update(data)
  end
end
