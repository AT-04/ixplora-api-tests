Feature: Gets the user

  Scenario: I get the user by id
    Given I perform "GET" request to "/users/{userId}"
    When  I send the user "ID"
    Then I expect a '200' status code
    And I expect the following JSON response
    """
    {
       "_id": "59cfc79b5641d906f70bdaf8",
       "name": "user01",
       "birthDate": "1990-02-05T00:00:00.000Z",
       "primaryEmail": "user01@mail.com",
       "validated": true,
       "country": "Congo, Republic of the (Brazzaville)",
       "city": "Congoman",
       "gender": "Other",
       "role": "editor",
       "__v": 0,
       "secondaryEmails": []
    }

    """
    And I verify the data bases