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

Scenario: Verify the company logo leads to the main page

Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `cssSelector(.header__logo-link)`
Then `${current-page-url}` matches `https://www\.epam\.com/?`

Scenario: Verify the theme can be switched

Given I am on main application page
When I execute javascript `return document.body.classList.contains('dark-mode') ? 'dark' : 'light'` and save result to scenario variable `themeBefore`
When I click on element located by `cssSelector(.header__vaulting-container .theme-switcher)`
When I wait until element located by `xpath(//body[not(contains(@class,'${themeBefore}-mode'))])` appears
When I execute javascript `return document.body.classList.contains('dark-mode') ? 'dark' : 'light'` and save result to scenario variable `themeAfter`
Then `${themeBefore}` is != `${themeAfter}`

Scenario: Verify the site language can be changed to Ukrainian

Given I am on main application page
When I click on element located by `cssSelector(.location-selector__button)`
When I click on element located by `cssSelector(.location-selector__link[lang='uk'])`
Then `${current-page-url}` matches `https://careers\.epam\.ua.*`
When I save `lang` attribute value of element located by `cssSelector(html)` to scenario variable `pageLang`
Then `${pageLang}` matches `uk.*`

Scenario: Verify location regions can be switched

Given I am on main application page
When I scroll element located by `xpath(//a[contains(@class,'tabs-23__link')][normalize-space(.)='AMERICAS'])` into view
Then number of elements found by `cssSelector(.tabs-23__link)` is equal to `3`
Then number of elements found by `xpath(//div[@data-item='0' and contains(@class,'active')]//div[contains(@class,'locations-viewer-23__country-title')][normalize-space(.)='Canada'])` is greater than `0`
When I click on element located by `xpath(//a[contains(@class,'tabs-23__link')][normalize-space(.)='EMEA'])`
Then number of elements found by `xpath(//div[@data-item='1' and contains(@class,'active')]//div[contains(@class,'locations-viewer-23__country-title')][normalize-space(.)='Germany'])` is greater than `0`
When I click on element located by `xpath(//a[contains(@class,'tabs-23__link')][normalize-space(.)='APAC'])`
Then number of elements found by `xpath(//div[@data-item='2' and contains(@class,'active')]//div[contains(@class,'locations-viewer-23__country-title')][normalize-space(.)='Japan'])` is greater than `0`

Scenario: Verify the search function

Given I am on main application page
When I click on element located by `cssSelector(.header-search__button)`
When I enter `AI` in field located by `id(new_form_search)`
When I click on element located by `cssSelector(.custom-search-button)`
Then `${current-page-url}` matches `.*/search\?q=AI.*`

Scenario: Verify required fields validation on the contact form

Given I am on page with URL `https://www.epam.com/about/who-we-are/contact`
When I scroll element located by `cssSelector(.button-submit .button-ui)` into view
When I click on element located by `cssSelector(.button-submit .button-ui)`
When I execute javascript `return ['user_first_name','user_last_name','user_email','user_phone','user_comment_how_hear_about'].map(function(n){return document.querySelector('[name="'+n+'"]').closest('[data-required-msg]').querySelector('.validation-text').textContent.trim();}).join('|')` and save result to scenario variable `errorsBefore`
Then `${errorsBefore}` is = `This is a required field|This is a required field|This is a required field|This is a required field|This is a required field`
When I enter `Test` in field located by `xpath(//input[@name='user_first_name'])`
When I click on element located by `cssSelector(.button-submit .button-ui)`
When I execute javascript `return 'error=[' + document.querySelector('[name="user_first_name"]').closest('[data-required-msg]').querySelector('.validation-text').textContent.trim() + ']'` and save result to scenario variable `firstNameErrorAfter`
Then `${firstNameErrorAfter}` is = `error=[]`
