Scenario: Computers category contains three subcategories with correct names

Given I am on main application page
When I click on element located by `cssSelector(.top-menu a[href='/computers'])`
Then number of elements found by `cssSelector(.sub-category-grid .item-box)` is equal to `3`
Then number of elements found by `xpath(//div[contains(@class,'sub-category-grid')]//h2/a[normalize-space(.)='Desktops'])` is equal to `1`
Then number of elements found by `xpath(//div[contains(@class,'sub-category-grid')]//h2/a[normalize-space(.)='Notebooks'])` is equal to `1`
Then number of elements found by `xpath(//div[contains(@class,'sub-category-grid')]//h2/a[normalize-space(.)='Accessories'])` is equal to `1`

Scenario: Verify items can be sorted using different options

Given I am on page with URL `https://demowebshop.tricentis.com/books`
When I select `Name: A to Z` in dropdown located by `id(products-orderby)`
Then elements located by `cssSelector(.product-grid .product-title a)` are sorted by text in ASCENDING order
When I select `Name: Z to A` in dropdown located by `id(products-orderby)`
Then elements located by `cssSelector(.product-grid .product-title a)` are sorted by text in DESCENDING order

Scenario: Verify the number of items displayed per page can be changed

Given I am on page with URL `https://demowebshop.tricentis.com/books`
When I select `4` in dropdown located by `id(products-pagesize)`
Then number of elements found by `cssSelector(.product-grid .item-box)` is equal to `4`
When I select `8` in dropdown located by `id(products-pagesize)`
Then number of elements found by `cssSelector(.product-grid .item-box)` is equal to `6`
