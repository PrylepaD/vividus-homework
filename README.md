# VIVIDUS homework

## Requirements
- Java 17+ (JDK)
- Google Chrome (latest)
- Git

## Clone
```
git clone --recurse-submodules https://github.com/PrylepaD/vividus-homework.git
cd vividus-homework
```

## Run (Windows, PowerShell)

Task 1 - EPAM UI
```
.\gradlew.bat runStories "-Pvividus.batch-1.resource-location=story/task1-epam" "-Pvividus.batch-1.resource-include-patterns=*.story" "-Pvividus.configuration.environments=epam_Prylepa"
```

Task 2 - Demo Web Shop UI
```
.\gradlew.bat runStories "-Pvividus.batch-1.resource-location=story/task2-webshop" "-Pvividus.batch-1.resource-include-patterns=*.story" "-Pvividus.configuration.environments=demowebshop_Prylepa"
```

Task 3 - Petstore API (in progress)

## Report
After each run: `output/reports/allure/index.html`
(open via a local web server, e.g. `python -m http.server 8000 --directory output/reports/allure`).
Ready reports: `submission/task-N-.../`.
