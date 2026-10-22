# VIVIDUS Test Automation Homework

Automated UI and API tests implemented using the **VIVIDUS Framework (v0.6.18)**.

## Prerequisites
- **Java 21** (Eclipse Adoptium OpenJDK)
- **Git** (clone with `--recurse-submodules`)
- **Google Chrome** (for UI tests)

## Clone the Repository
```bash
git clone --recurse-submodules https://github.com/PrylepaD/vividus-homework.git
cd vividus-homework
```

## Project Structure
- **Task 1** (EPAM UI, 9 scenarios): `src/main/resources/story/task1-epam/epam.story`
- **Task 2** (Demo Web Shop UI, 9 scenarios): `src/main/resources/story/task2-webshop/*.story`
- **Task 3** (Swagger Petstore API, 8 scenarios): `src/main/resources/story/task3-api/*.story`
- **Test execution reports** (Allure archives and screenshots): `submission/`

## How to Run Tests (Windows, PowerShell)

### Task 1 — EPAM UI
```powershell
.\gradlew.bat runStories "-Pvividus.batch-1.resource-location=story/task1-epam" "-Pvividus.batch-1.resource-include-patterns=*.story" "-Pvividus.configuration.environments=epam_Prylepa"
```

### Task 2 — Demo Web Shop UI
```powershell
.\gradlew.bat runStories "-Pvividus.batch-1.resource-location=story/task2-webshop" "-Pvividus.batch-1.resource-include-patterns=*.story" "-Pvividus.configuration.environments=demowebshop_Prylepa"
```

### Task 3 — Swagger Petstore API
```powershell
.\gradlew.bat runStories "-Pvividus.batch-1.resource-location=story/task3-api" "-Pvividus.batch-1.resource-include-patterns=*.story" "-Pvividus.configuration.environments=petstore_Prylepa"
```

## Code Formatting & Verification
```powershell
.\gradlew.bat spotlessApply
```

## Report
After each run the Allure report is generated at `output/reports/allure/index.html`.
Open it via a local web server, for example:
```powershell
python -m http.server 8000 --directory output/reports/allure
```
Then go to http://localhost:8000.

Ready-made reports are stored in `submission/task-N-.../`.