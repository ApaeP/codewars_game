require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
require 'capybara/rails'


Capybara.server = :puma, { Silent: true }

Capybara.register_driver :selenium do |app|
  # Capybara::Selenium::Driver.new(app, browser: :chrome)
  options = ::Selenium::WebDriver::Chrome::Options.new

  # options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
Capybara.javascript_driver = :chrome_headless

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end

# for 646 katas - 647 solutions
# in
  # 818.4 sec
  # 13.6 min
  # 818448ms (ActiveRecord: 10684.1ms | Allocations: 25960971)
