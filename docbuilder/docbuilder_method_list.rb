# frozen_string_literal: true

require_relative '../manager'


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

# REDACTOR = 'textdocumentapi'
# REDACTOR = 'spreadsheetapi'
REDACTOR = 'presentationapi'
# REDACTOR = 'formapi'

@driver.navigate.to "https://api.teamlab.info/officeapi/#{REDACTOR}"

KEY = 'apicommentreply'

XPATH = "//li/a[contains(@href, '/officeapi/#{REDACTOR}/#{KEY}')]"
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
