# frozen_string_literal: true

require 'selenium-webdriver'

# configure  the driver to run in headless mode
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome, options: options

driver.navigate.to 'https://api.teamlab.info/docbuilder/spreadsheetapi/api/event-onworksheetchange'

xpath = "//h4[@class='header-gray']"
el = driver.find_elements(:xpath, xpath)
p el

driver.quit
