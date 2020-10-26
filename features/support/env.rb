require 'watir'
require 'pry'
require 'byebug'
require 'faker'
require 'cucumber'

browser = Watir::Browser.new

page = lambda{|b, klass| klass.new b}.curry.(browser)
browser.driver.manage.window.maximize

CONFIG = YAML.load_file('config/config.yml')

Before do
  @page = page
  @browser = browser
end
