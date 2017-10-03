Feature: Surveys

  Background:
    Given I perform "POST" request to "/users"
    When  I set the following body:
    """
    {
     "_id": "",
     "name": "Demo001",
     "primaryEmail": "demo001@mail.com",
     "password": "secretixplora",
     "birthDate": "2001-01-01T00:00:00.000Z",
     "secondaryEmails": [],
     "validated": false,
     "country": "Bolivia",
     "city": "Cochabamba",
     "gender": "Male",
     "role": "editor"
    }
    """
    And I send the request
    Then I expect a "201" status code
    And I perform "POST" request to "/health"

  Scenario: I get all existing surveys of an editor user
    Given I perform "GET" request to "/health"
    And I send the request
    Then I expect a "200" status code
