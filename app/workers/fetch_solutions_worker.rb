class FetchSolutionsWorker# < ActiveJob::Base
  # include Sidekiq::Worker
  LOGIN_PAGE = 'https://www.codewars.com/users/sign_in'

  def initialize(user)
    @user = user

  end

  # def perform(user)#, solutions)
  #   # build_browser
  #   # solutions.first(10).pluck(:codewars_id)
  #   # solutions.first(10).each do |solution|
  #   #   navigate_to_kata_solutions(solution.codewars_id)
  #   #   kata_solutions = read_kata_solutions
  #   #   solution.update(content: kata_solutions[solution.language])
  #   # end
  # end

  def build_browser
    @browser = Capybara.current_session
    @driver = @browser.driver.browser
    @browser.visit(LOGIN_PAGE)
    return unless @browser.current_url == LOGIN_PAGE
    @browser.find(id: 'user_email').set(@user.codewars_email)
    @browser.find(id: 'user_password').set(@user.codewars_password)
    @browser.all('button').last.click
  end

  def navigate_to_kata_solutions(id)
    @browser.visit("https://www.codewars.com/kata/#{id}/train")
    @browser.find('a[data-tab=solutions]').click
  end

  # katajs = Kata.find_by(codewars_id: "583f158ea20cfcbeb400000a")
  def read_kata_solutions
    solutions = {}
    doc = Nokogiri::HTML(@driver.page_source)
    solutions_node = doc.search('li[data-tab=solutions]').children.first
    solutions_node.children.each do |solution|
      solutions[solution.at('p').remove.text.downcase] = solution.text
    end
    solutions
  end
end
