# frozen_string_literal: true

require_relative '../manager'

# require 'selenium-webdriver'
#
# # configure the driver to run in headless mode
# options = Selenium::WebDriver::Chrome::Options.new
# options.add_argument('--headless')
# driver = Selenium::WebDriver.for :chrome, options: options

# REDACTOR = 'textdocumentapi'
# REDACTOR = 'spreadsheetapi'
REDACTOR = 'presentationapi'

@driver.navigate.to "https://api.teamlab.info/docbuilder/#{REDACTOR}"

def cutoff_after_blank(array)
  array.each_with_index do |el, i|
    if el == ''
      return array[0..i - 1]
    end
  end
end

def array_cleanup(array)
  # Remove first el because xpath.contains() gets all el list
  # result_array.reject! do |value| value.empty? end
  array.shift if array.first.to_s.empty?
  # Remove last empty el
  array.pop if array.last.to_s.empty?
  cutoff_after_blank(array)
end

#######################

KEY = 'apislide'

XPATH = "//li/a[contains(@href, '/docbuilder/#{REDACTOR}/#{KEY}')]"
elements = @driver.find_elements(:xpath, XPATH)
element_array =  elements.map { |el| el.attribute('title')  }
element_array = array_cleanup(element_array)

print JSON.pretty_generate("#{KEY}": element_array)
File.write(File.join(Dir.pwd,'docbuilder','docbuilder_method.json'),
           JSON.pretty_generate("#{KEY}": element_array))

@driver.quit

# resize the window and take a screenshot
# t = Time.new
# @driver.manage.window.resize_to(1200, 800)
# @driver.save_screenshot "#{t.to_i}screenshot.png"
