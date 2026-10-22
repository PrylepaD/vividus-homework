Scenario: Verify an item can be added to the Wishlist

Given I am on page with URL `https://demowebshop.tricentis.com/black-white-diamond-heart`
When I click on element located by `xpath(//input[@value='Add to wishlist'])`
When I wait until element located by `cssSelector(.wishlist-qty)` has text matching `.*\([1-9]\d*\).*`
Given I am on page with URL `https://demowebshop.tricentis.com/wishlist`
Then number of elements found by `xpath(//table[contains(@class,'cart')]//a[contains(text(),'Diamond')])` is equal to `1`

Scenario: Verify an item can be added to the cart

Given I am on page with URL `https://demowebshop.tricentis.com/fiction`
When I click on element located by `id(add-to-cart-button-45)`
When I wait until element located by `cssSelector(.cart-qty)` has text matching `.*\([1-9]\d*\).*`
Given I am on page with URL `https://demowebshop.tricentis.com/cart`
Then number of elements found by `xpath(//table[contains(@class,'cart')]//a[text()='Fiction'])` is equal to `1`

Scenario: Verify an item can be removed from the cart

Given I am on page with URL `https://demowebshop.tricentis.com/cart`
When I check checkbox located by `xpath(//input[@name='removefromcart'])`
When I click on element located by `xpath(//input[@name='updatecart'])`
Then text `Your Shopping Cart is empty!` exists

Scenario: Verify checkout is possible for an item

Given I am on page with URL `https://demowebshop.tricentis.com/fiction`
When I click on element located by `id(add-to-cart-button-45)`
When I wait until element located by `cssSelector(.cart-qty)` has text matching `.*\([1-9]\d*\).*`
Given I am on page with URL `https://demowebshop.tricentis.com/cart`
When I check checkbox located by `id(termsofservice)`
When I click on element located by `id(checkout)`
When I click on element located by `cssSelector(input.checkout-as-guest-button)`
When I enter `John` in field located by `id(BillingNewAddress_FirstName)`
When I enter `Doe` in field located by `id(BillingNewAddress_LastName)`
When I enter `#{generate(Internet.emailAddress)}` in field located by `id(BillingNewAddress_Email)`
When I select `Ukraine` in dropdown located by `id(BillingNewAddress_CountryId)`
When I enter `Kyiv` in field located by `id(BillingNewAddress_City)`
When I enter `Khreshchatyk 1` in field located by `id(BillingNewAddress_Address1)`
When I enter `01001` in field located by `id(BillingNewAddress_ZipPostalCode)`
When I enter `+380501234567` in field located by `id(BillingNewAddress_PhoneNumber)`
When I click on element located by `cssSelector(#billing-buttons-container input.button-1)`
When I wait until element located by `cssSelector(#shipping-buttons-container input.button-1)` appears
When I click on element located by `cssSelector(#shipping-buttons-container input.button-1)`
When I wait until element located by `cssSelector(#shipping-method-buttons-container input.button-1)` appears
When I click on element located by `cssSelector(#shipping-method-buttons-container input.button-1)`
When I wait until element located by `cssSelector(#payment-method-buttons-container input.button-1)` appears
When I click on element located by `cssSelector(#payment-method-buttons-container input.button-1)`
When I wait until element located by `cssSelector(#payment-info-buttons-container input.button-1)` appears
When I click on element located by `cssSelector(#payment-info-buttons-container input.button-1)`
When I wait until element located by `cssSelector(#confirm-order-buttons-container input.button-1)` appears
When I click on element located by `cssSelector(#confirm-order-buttons-container input.button-1)`
When I wait until element located by `cssSelector(.order-completed)` appears
Then text `Your order has been successfully processed!` exists
