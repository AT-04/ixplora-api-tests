Feature: Surveys

  Background:
    Given I perform "POST" request to "/users"
    When  I set the following "user_request" body
    """
    {
     "_id": "",
     "name": "user01",
     "primaryEmail": "user01@mail.com",
     "password": "secretixplora",
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
    And I store the "user" response body
    And I perform query using "{user._id}" to the "email_tokens" document
    And I store the "token" of query result as "mail_token"
    And I perform "POST" request to "/tokens"
    And I set the following custom body:
      | token | mail_token |
    And I send the request
    Then I expect a "200" status code
    And I perform "POST" request to "/users/login"
    And I set the following custom body:
      | email    | {user.primaryEmail}     |
      | password | {user_request.password} |
      | type     | 0                       |
      | app      | MOBILE_APP              |
    And I send the request
    Then I expect a "200" status code
    And I store the "login_user" response body

  Scenario: I get all existing surveys of an editor user
    Given I perform "GET" request to "/surveys"
    And I set the Authorization token "{login_user.token}"
    And I send the request
    Then I expect a "200" status code
