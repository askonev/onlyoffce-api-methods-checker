# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require_relative 'lib/parse_helper'

def logger
  @logger = Logger.new(STDOUT)
end

MODE = 'prod'

case MODE
when 'prod'
  # configure the driver to run in headless mode
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  @driver = Selenium::WebDriver.for :chrome, options: options
when 'dev'
  @driver = Selenium::WebDriver.for :chrome, options: options
else
  p 'incorrect mode'
end
