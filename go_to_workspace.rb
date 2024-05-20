# freeze

require_relative 'manager'
require_relative './page_object/workspace_dropdown'

# page = WorkspaceDropdown.new(@driver)
PUSHY = '//ul[contains(@class, "top-nav all-menu-items")]//li[contains(@class, "pushy-submenu active")]'

@driver.navigate.to 'https://api.teamlab.info/portals'
target_element = @driver.find_element(:xpath, PUSHY)

link(:workspaceapi, xpath: "#{PUSHY}//a[@class='/workspaceapi']")

# Interact with the dropdown
# page.ws_dropdown_element.select_by(:index, 1) # Replace 'Option Text' with the visible text of the option

action = @driver.action
action.move_to(target_element).perform

workspaceapi_element.click

# Close the browser
@driver.quit
