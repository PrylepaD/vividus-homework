Scenario: Computers category contains three subcategories with correct names

Given I am on main application page

When I click on element located by `cssSelector(.top-menu a[href='/computers'])`

Then number of elements found by `cssSelector(.sub-category-grid .item-box)` is equal to `3`

Then number of elements found by `xpath(//div[contains(@class,'sub-category-grid')]//h2/a[normalize-space(.)='Desktops'])` is equal to `1`
Then number of elements found by `xpath(//div[contains(@class,'sub-category-grid')]//h2/a[normalize-space(.)='Notebooks'])` is equal to `1`
Then number of elements found by `xpath(//div[contains(@class,'sub-category-grid')]//h2/a[normalize-space(.)='Accessories'])` is equal to `1`
