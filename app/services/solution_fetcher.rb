require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
require 'capybara/rails'

class SolutionFetcher
  LOGIN_PAGE = 'https://www.codewars.com/users/sign_in'

  def initialize(user)
    @user = user
    build_browser
    authenticate
  end

  def build_browser
    @browser = Capybara.current_session
    @driver = @browser.driver.browser
  end

  def test
    # binding.pry
  end

  def authenticate
    @browser.visit(LOGIN_PAGE)
    return unless @browser.current_url == LOGIN_PAGE
    @browser.find(id: 'user_email').set(@user.codewars_email)
    @browser.find(id: 'user_password').set(@user.codewars_password)
    @browser.all('button').last.click
  end

  def navigate_to_kata_solution(kata)
    @browser.visit("https://www.codewars.com/kata/#{kata.codewars_id}/train")
    @browser.find('a[data-tab=solutions]').click
  end

  # katajs = Kata.find_by(codewars_id: "583f158ea20cfcbeb400000a")
  def read_solutions
    solutions = {}
    doc = Nokogiri::HTML(@driver.page_source)
    solutions_node = doc.search('li[data-tab=solutions]').children.first
    solutions_node.children.each do |solution|
      solutions[solution.at('p').remove.text.downcase] = solution.text
    end
    solutions
  end

  def disconnect_user
    Capybara.current_session.driver.quit
  end

end

# class BrowserController
#   require 'watir'

#   def initialize
#     @browser = nil
#     @url = nil
#     @data = Hash.new
#     @api_data = []
#   end

#   def open_browser_authenticated
#     puts "\nOpening browser\n"
#     open_browser
#     authenticate
#   end

#   def fetch_data(data)
#     hsh = {url: "https://www.codewars.com/kata/#{data["id"]}/train/ruby"}
#     navigate_to(hsh[:url])
#     hsh[:cd_id] = data["id"]
#     hsh[:language] = define_language(hsh[:url])
#     hsh[:level] = read_level
#     hsh[:title] = read_title
#     hsh[:instructions] = read_instructions
#     hsh[:solution] = read_solution
#     hsh[:completed_at] = data["completedAt"].empty? ? DateTime.now : DateTime.parse(data["completedAt"])
#     hsh
#   end

#   def close_browser
#     close
#   end

#   def open_browser
#     Watir.default_timeout = 10
#     @browser = Watir::Browser.new
#     @browser.window.resize_to 1600, 900
#   end

#   def open?
#     @browser
#   end

#   def authenticate
#     @browser.goto('https://www.codewars.com/users/sign_in')
#     @browser.text_field(id: 'user_email').set(K_ENV[:account])
#     @browser.text_field(id: 'user_password').set(K_ENV[:password])
#   end

#   def navigate_to(url)
#     @browser.goto(url)
#   end

#   def define_language(url)
#     url.match(/\w+\z/)[0]
#   end

#   def read_title
#     title = @browser.title
#     title = title.start_with?('Training on') ? title[12..title.chars.index('|') - 2] : title[0..title.chars.index('|') - 2]
#     title.gsub(/[^\w\s]/, '')
#   end

#   def read_level
#     x = @browser.view(id: 'cc_play_view').text[0]
#     return x if x.match?(/\d/)

#     case x.downcase
#     when "b" then "Beta"
#     when "r" then "Retired"
#     when "d" then "Draft"
#     end
#   end

#   def read_instructions
#     @browser.div(id: 'description').text
#   end

#   def read_solution
#     # TODO
#     @browser.a(data_tab: 'solutions').click
#     start_index, solution = 2, ""
#     until solution.start_with?('Ruby') || solution.start_with?('JavaScript')
#       solution = @browser.div(id: 'description_area').li(index: start_index).text
#       start_index += 1
#       binding.pry if start_index == 50
#     end
#     solution
#   end

#   def close
#     @browser.close
#   end
