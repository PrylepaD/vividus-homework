Scenario: Register a new user

Given I initialize story variable `email` with value `#{generate(Internet.emailAddress)}`
Given I initialize story variable `password` with value `TrainingPass123!`

Given I am on page with URL `https://demowebshop.tricentis.com/register`

When I enter `Test` in field located by `id(FirstName)`
When I enter `Prylepa` in field located by `id(LastName)`
When I enter `${email}` in field located by `id(Email)`
When I enter `${password}` in field located by `id(Password)`
When I enter `${password}` in field located by `id(ConfirmPassword)`
When I click on element located by `id(register-button)`

Then text `Your registration completed` exists

Scenario: Log in with the registered user

When I click on element located by `cssSelector(a.ico-logout)`

Given I am on page with URL `https://demowebshop.tricentis.com/login`

When I enter `${email}` in field located by `id(Email)`
When I enter `${password}` in field located by `id(Password)`
When I click on element located by `cssSelector(input.login-button)`

Then number of elements found by `cssSelector(a.ico-logout)` is equal to `1`
Then text `${email}` exists
