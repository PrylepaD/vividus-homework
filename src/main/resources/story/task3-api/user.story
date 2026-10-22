Meta:
    @epic Petstore_API
    @feature User_API

Lifecycle:
Before:
Scope: STORY
Given I initialize story variable `userId` with value `#{randomInt(100000, 999999)}`
Given I initialize story variable `username` with value `user_#{generate(regexify '[a-z]{6}')}`
Given I initialize story variable `password` with value `Pass_#{randomInt(1000, 9999)}`


Scenario: 1. Verify a user can be created
Given request body:
{
  "id": ${userId},
  "username": "${username}",
  "firstName": "Dmytro",
  "lastName": "Prylepa",
  "email": "${username}@example.com",
  "password": "${password}",
  "phone": "1234567890",
  "userStatus": 1
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `${petstore-url}/user`
Then `${response-code}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.code` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"${userId}"`


Scenario: 2. Verify a user can log in
When I execute HTTP GET request for resource with URL `${petstore-url}/user/login?username=${username}&password=${password}`
Then `${response-code}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.code` is equal to `200`
Then `${response}` matches `.*logged in user session:[0-9]+.*`


Scenario: 3. Verify a list of users can be created
Given I initialize scenario variable `user2Id` with value `#{randomInt(100000, 999999)}`
Given I initialize scenario variable `user2Name` with value `user_#{generate(regexify '[a-z]{6}')}`
Given I initialize scenario variable `user3Id` with value `#{randomInt(100000, 999999)}`
Given I initialize scenario variable `user3Name` with value `user_#{generate(regexify '[a-z]{6}')}`
Given request body:
[
  {
    "id": ${user2Id},
    "username": "${user2Name}",
    "firstName": "Alice",
    "lastName": "Smith",
    "email": "${user2Name}@example.com",
    "password": "${password}",
    "phone": "1112223333",
    "userStatus": 1
  },
  {
    "id": ${user3Id},
    "username": "${user3Name}",
    "firstName": "Bob",
    "lastName": "Jones",
    "email": "${user3Name}@example.com",
    "password": "${password}",
    "phone": "4445556666",
    "userStatus": 1
  }
]
When I set request headers:
|name        |value           |
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `${petstore-url}/user/createWithList`
Then `${response-code}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.code` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"ok"`


Scenario: 4. Verify a user can log out
When I execute HTTP GET request for resource with URL `${petstore-url}/user/logout`
Then `${response-code}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.code` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"ok"`
