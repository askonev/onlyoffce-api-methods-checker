g# frozen_string_literal: true

require_relative '../manager'

include Parse

@driver.navigate.to 'https://api.teamlab.info/portals'

#########################

# # HOSTED SOLUTION
# SECTION = 'portalsection'
# XPATH = "//a[contains(@href, 'apisystem/#{SECTION}')]/following-sibling::ul/li/a"
# print XPATH
# elements = @driver.find_elements(:xpath, XPATH)
# p elements

# USAGE API
SECTION = 'crm'
DATA = 'contacts'
ELEMENT, KEY = DATA.split('/')

case KEY
when nil
  XPATH = "//a[contains(@href, '#{SECTION}/#{ELEMENT}')]/following-sibling::ul/li/a"
  logger.info XPATH
  elements = @driver.find_elements(:xpath, XPATH)
  pretty_json = JSON.pretty_generate("#{ELEMENT}": parsing(elements))
else
  XPATH = "//a[contains(@href, '#{SECTION}/#{ELEMENT}/#{KEY}')]/following-sibling::ul/li/a"
  logger.info XPATH
  elements = @driver.find_elements(:xpath, XPATH)
  pretty_json = JSON.pretty_generate("#{KEY}": parsing(elements))
end

File.write(File.join(Dir.pwd,'community_server','community_server_method.json'), pretty_json)
print pretty_json

@driver.quit
