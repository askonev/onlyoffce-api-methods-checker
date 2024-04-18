# frozen_string_literal: true

require_relative '../manager'

include Parse

@driver.navigate.to 'https://api.teamlab.info/docspace/basic'
# @driver.navigate.to 'https://api.onlyoffice.com/docspace/basic'

DATA = 'group'
SECTION = 'section'

def _write(json)
  File.write(File.join(Dir.pwd,'docspace','docspace_method.json'), json)
end

ELEMENT, KEY = DATA.split('/')
case KEY
when nil
  XPATH = "//a[contains(@href, 'docspace/#{SECTION}/#{ELEMENT}')]/following-sibling::ul/li/a"
  logger.info XPATH
  elements = @driver.find_elements(:xpath, XPATH)
  pretty_json = JSON.pretty_generate("#{ELEMENT}": parsing(elements))
else
  XPATH = "//a[contains(@href, 'docspace/#{SECTION}/#{ELEMENT}/#{KEY}')]/following-sibling::ul/li/a"
  logger.info XPATH
  elements = @driver.find_elements(:xpath, XPATH)
  pretty_json = JSON.pretty_generate("#{KEY}": parsing(elements))
end

_write(pretty_json)
print("\n", pretty_json)

@driver.quit
