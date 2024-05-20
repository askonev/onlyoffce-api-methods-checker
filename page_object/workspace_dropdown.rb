
require_relative '../manager'

class WorkspaceDropdown
  include PageObject

  PUSHY = '//ul[contains(@class, "top-nav all-menu-items")]//li[contains(@class, "pushy-submenu active")]'

  select_list(:ws_dropdown, xpath: PUSHY)
end
