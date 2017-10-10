@functional
Feature: Users

  @delete_created_data
  Scenario Outline: Verify the negative responses after POST a new user
    Given I perform "POST" request to "/users"
    When  I set the following body
    """
    {
      "birthDate": "<BIRTH>",
      "city": "<CITY>",
      "country": "<COUNTRY>",
      "gender": "<GENDER>",
      "name": "<NAME>",
      "password": "<PASS>",
      "primaryEmail": "<PRI_MAIL>",
      "role": "<ROLE>",
      "secondaryEmails": "<SEC_MAIL>",
      "validated": "<VAL>",
      "__v": 0,
      "_id": ""

    }
    """
    And I store the request body as "user_request"
    And I send the request
    Then I expect a "400" status code
    And I store the response body as "user_response"
    Then I verify "user_response" with following expected response
    """
    {
     "statusCode": 400,
     "details": "User couldn't be created, some field are required"
    }
    """
    Examples:
      | BIRTH                | CITY   | COUNTRY | GENDER | NAME      | PASS    | PRI_MAIL      | ROLE | SEC_MAIL | VAL   |
      |                      | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z |        | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz |         | Male   | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia |        | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   |           | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav |         | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 |               | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com |      |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          |       |
      |                      |        |         |        |           |         |               |      |          |       |
      | "·%&ª\'¿             | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | "·%&ª\ | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | "·%&ª\  | Male   | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | "·%&ª\ | Simon Gav | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | "·%&ª\ \' | secret1 | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | "·%&ª\  | user@mail.com | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | "·%&ª\        | user |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | "·%& |          | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | "·%&ª |
      | "·%&ª\'¿             | "·%&ª\ | "·%&ª\  | "·%&ª\ | "·%&ª\ \' | "·%&ª\  | "·%&ª\        | "·%& |          | "·%&ª |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      |                      | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z |        | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz |         | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª¿    | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia |        | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   |           | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav |         | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 |               | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com |      | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   |       |
      |                      |        |         |        |           |         |               |      | ·%&ª\¿   |       |
      | "·%&ª\'¿             | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | "·%&ª\ | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | "·%&ª\  | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | "·%&ª\ | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | "·%&ª\ \' | secret1 | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | "·%&ª\  | user@mail.com | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | "·%&ª\        | user | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | "·%& | ·%&ª\¿   | false |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | "·%&ª |
      | "·%&ª\'¿             | "·%&ª\ | "·%&ª\  | "·%&ª\ | "·%&ª\ \' | "·%&ª\  | "·%&ª\        | "·%& | ·%&ª\¿   | "·%&ª |
      |                      | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z |        | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz |         | Male   | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia |        | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   |           | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav |         | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 |               | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com |      |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | "·%&ª\'¿             | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | "·%&ª\ | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | "·%&ª\  | Male   | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | "·%&ª\ | Simon Gav | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | "·%&ª\ \' | secret1 | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | "·%&ª\  | user@mail.com | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | "·%&ª\        | user |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | "·%& |          | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\    | true  |
      |                      | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z |        | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz |         | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia |        | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   |           | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav |         | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 |               | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com |      | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | "·%&ª\'¿             | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | "·%&ª\ | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | "·%&ª\  | Male   | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | "·%&ª\ | Simon Gav | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | "·%&ª\ \' | secret1 | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | "·%&ª\  | user@mail.com | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | "·%&ª\        | user | ·%&ª\¿   | true  |
      | 1980-03-08T13:00:00Z | La Paz | Bolivia | Male   | Simon Gav | secret1 | user@mail.com | "·%& | ·%&ª\¿   | true  |
