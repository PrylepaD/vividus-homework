Scenario: Verify the page title

Given I am on main application page
Then page title is equal to `EPAM | Software Engineering & Product Development Services`

Scenario: Verify the policies list

Given I am on main application page
When I scroll element located by `xpath(//footer)` into view
Then text `INVESTORS` exists
Then text `COOKIE POLICY` exists
Then text `OPEN SOURCE` exists
Then text `APPLICANT PRIVACY NOTICE` exists
Then text `PRIVACY POLICY` exists
Then text `WEB ACCESSIBILITY` exists
