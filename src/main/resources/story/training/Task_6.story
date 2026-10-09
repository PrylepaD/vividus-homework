Meta:
    @group Training
    @requirementId MyTask-0006

Lifecycle:
Examples:
|userName           |password        |
|${swagGoodUserName} |${swagPassword} |
|${swagSlowUserName} |${swagPassword} |

Scenario: Navigate to the website homepage

When I set browser command line arguments to `--incognito`
Given I am on main application page
When I wait until element located by `id(login-button)` appears

Scenario: Log In

When I enter `<userName>` in field located by `id(user-name)`
When I enter `<password>` in field located by `id(password)`
When I click on element located by `id(login-button)`
When I wait until element located by `className(inventory_list)` appears
Then text `Products` exists

Scenario: Add item to the shopping cart

When I wait until element located by `id(<itemPageId>)` appears
Then text `<itemName>` exists
When I wait until element located by `id(<addToCartButtonId>)` appears
When I scroll element located by `id(<addToCartButtonId>)` into view
When I wait until element located by `id(<addToCartButtonId>)` stops moving
When I take screenshot
When I click on element located by `id(<addToCartButtonId>)`
When I take screenshot
When I wait until element located by `id(<removeButtonId>)` appears

Examples:
|itemName              |itemPageId       |addToCartButtonId                 |removeButtonId                 |
|Sauce Labs Backpack   |item_4_title_link |add-to-cart-sauce-labs-backpack    |remove-sauce-labs-backpack      |
|Sauce Labs Bike Light |item_0_title_link |add-to-cart-sauce-labs-bike-light  |remove-sauce-labs-bike-light    |
|Sauce Labs Bolt T-Shirt|item_1_title_link |add-to-cart-sauce-labs-bolt-t-shirt|remove-sauce-labs-bolt-t-shirt  |

Scenario: Validate the number of items in the shopping cart

When I click on element located by `className(shopping_cart_link)`
When I wait until element located by `id(checkout)` appears
Then number of elements found by `className(cart_item)` is equal to `3`

Scenario: Log Out

When I click on element located by `id(react-burger-menu-btn)`
When I wait until element located by `id(reset_sidebar_link)` appears
When I click on element located by `id(reset_sidebar_link)`
When I wait until element located by `id(logout_sidebar_link)` appears
When I click on element located by `id(logout_sidebar_link)`
When I wait until element located by `id(login-button)` appears
Then number of elements found by `id(login-button)` is equal to `1`
