require 'capybara'
require 'capybara/cucumber'
require 'date'
require 'dotenv/load'
require 'factory_bot'
require 'faker'
require 'pry'
require 'report_builder'
require 'rspec'
require 'selenium-webdriver'
require_relative 'helper'

include Helper

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/environments/#{ENV['ENV_TYPE']}.yml"))
EL = YAML.load_file('features/support/config/elements.yml')
World(FactoryBot::Syntax::Methods)

Dotenv.load('.env.local')

DATA =
  if ENV['DEV']
    YAML.load_file('features/support/config/environments/dev.yml')
  elsif ENV['HML']
    YAML.load_file('features/support/config/environments/hml.yml')
  else
    YAML.load_file('features/support/config/environments/hml.yml')
  end

@browser = ENV['BROWSER']

case @browser
when 'firefox'
  @driver = :selenium
when 'firefox_headless'
  @driver = :selenium_headless
when 'chrome'
  @driver = :selenium_chrome
when 'chrome_headless'
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_argument '--headless'
      options.add_argument '--disable-gpu'
      options.add_argument '--no-sandbox'
      options.add_argument '--disable-site-isolation-trials'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
else
  puts 'Invalid browser'
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 15
end
