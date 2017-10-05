Feature: Put users login password
  @precondition
  Scenario: APrecondition
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/users/login" end point can performing a "POST" request
    Given I perform "POST" request to "/users/login"
    When I send the request
    Then I expect a "201" status code
    And I store the response body as "user_response_post_login"
    And I verify that "user_response_post_login" body contains
