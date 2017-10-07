@CRUD
Feature: Create a new user

  Scenario: Verify that "/users" end point can perform "POST" request
    Given I perform "POST" request to "/users"
    When  I set and store the following "user_request" body
    """
    {
     "_id": "",
     "name": "Juan Mango",
     "primaryEmail": "Juan.Mango@gmail.com",
     "password": "secret_",
     "birthDate": "2001-01-01T00:00:00.000Z",
     "secondaryEmails": [],
     "validated": false,
     "country": "Bolivia",
     "city": "Cochabamba",
     "gender": "Male",
     "role": "user"
    }
    """
    And I send the request
    Then I expect a "201" status code
    And I store the response body as "user_response"
    Then I verify "user_response" with following expected response
    """
  {
  "status": "404",
  "source": "/users/password",
  "detail": "User does not exist"
  }
  """
