@CRUD
Feature: User Tokens

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/tokens" end point can performing "POST" request
    Given I perform "POST" request to "/tokens"
    When  I set and store the following "token_request" body
    """
    {
      "token": "{}"
     }
    """
    When I send the request
    Then I expect a "201" status code
    And I store the response body as "token_response"
    And I verify that "token_response" body contains
