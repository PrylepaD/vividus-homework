Meta:
    @epic Petstore_API
    @feature Pet_API

Lifecycle:
Before:
Scope: STORY
Given I initialize story variable `petId` with value `#{randomInt(1000000, 9999999)}`
Given I initialize story variable `initialPetName` with value `Buddy_#{randomInt(100, 999)}`
Given I initialize story variable `updatedPetName` with value `Max_#{randomInt(100, 999)}`


Scenario: 5. Verify a new pet can be added
Given request body:
{
  "id": ${petId},
  "category": {
    "id": 1,
    "name": "Dogs"
  },
  "name": "${initialPetName}",
  "photoUrls": [
    "https://example.com/photo1.jpg"
  ],
  "tags": [
    {
      "id": 1,
      "name": "friendly"
    }
  ],
  "status": "available"
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `${petstore-url}/pet`
Then `${response-code}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.id` is equal to `${petId}`
Then JSON element from `${response}` by JSON path `$.name` is equal to `"${initialPetName}"`
Then JSON element from `${response}` by JSON path `$.status` is equal to `"available"`


Scenario: 6. Verify a pet's image can be updated
Given multipart request:
|type  |name              |value                        |contentType|fileName|
|STRING|additionalMetadata|Updated profile picture      |text/plain |        |
|FILE  |file              |/story/task3-api/pet.png     |image/png  |pet.png |
When I execute HTTP POST request for resource with URL `${petstore-url}/pet/${petId}/uploadImage`
Then `${response-code}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.code` is equal to `200`
Then `${response}` matches `.*pet\.png.*`


Scenario: 7. Verify a pet's name and status can be updated
Given request body:
{
  "id": ${petId},
  "category": {
    "id": 1,
    "name": "Dogs"
  },
  "name": "${updatedPetName}",
  "photoUrls": [
    "https://example.com/photo1.jpg"
  ],
  "tags": [
    {
      "id": 1,
      "name": "friendly"
    }
  ],
  "status": "sold"
}
When I set request headers:
|name        |value           |
|Content-Type|application/json|
When I execute HTTP PUT request for resource with URL `${petstore-url}/pet`
Then `${response-code}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.id` is equal to `${petId}`
Then JSON element from `${response}` by JSON path `$.name` is equal to `"${updatedPetName}"`
Then JSON element from `${response}` by JSON path `$.status` is equal to `"sold"`


Scenario: 8. Verify a pet can be deleted
When I execute HTTP DELETE request for resource with URL `${petstore-url}/pet/${petId}`
Then `${response-code}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.code` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"${petId}"`
