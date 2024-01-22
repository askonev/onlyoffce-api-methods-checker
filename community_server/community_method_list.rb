# frozen_string_literal: true

require_relative '../manager'

include Parse

@driver.navigate.to 'https://api.teamlab.info/portals'

#########################

# HOSTED SOLUTION
# SECTION = 'portalsection'
# XPATH = "//a[contains(@href, 'apisystem/#{SECTION}')]/following-sibling::ul/li/a"
# print XPATH
# elements = @driver.find_elements(:xpath, XPATH)
# p elements

# USAGE API
SECTION = 'section'
DATA = 'files/files'
ELEMENT, KEY = DATA.split('/')
XPATH = "//a[contains(@href, '#{SECTION}/#{ELEMENT}/#{KEY}')]/following-sibling::ul/li/a"
logger.info XPATH

elements = @driver.find_elements(:xpath, XPATH)

# print/write json
elements = parsing(elements)
pretty_json = JSON.pretty_generate("#{KEY}": elements)
print pretty_json

File.write(File.join(Dir.pwd,'community_server','community_server_method.json'), pretty_json)

@driver.quit
