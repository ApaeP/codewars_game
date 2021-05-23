class ApiManager
  # require 'json'
  # require 'net/http'
  # require 'uri'
  # include ViewHelper

  def initialize(**attributes)
    @token = attributes[:api_token]
    @base_uri = URI.parse("https://www.codewars.com/api/v1/users/#{attributes[:nickname]}/code-challenges/completed?page=")
    @request_options = { use_ssl: @base_uri.scheme == "https" }
    @data = []
  end

  def fetch_all
    @first_raw_page = fetch_page(0)
    @num_of_pages = @first_raw_page["totalPages"]
    @data = @first_raw_page["data"]
    retrieve_next_pages unless @num_of_pages <= 1

    @data.flatten
  end

  def fetch_page(page)
    request = Net::HTTP::Get.new("#{@base_uri}#{page}")
    request["Authorization"] = @token
    response = Net::HTTP.start(@base_uri.hostname, @base_uri.port, @request_options) do |http|
      http.request(request)
    end
    JSON.parse(response.body)
  end

  def retrieve_next_pages
    (1..@num_of_pages).to_a.each do |page|
      @data << fetch_page(page)["data"]
      @data.flatten!
    end
  end
end
