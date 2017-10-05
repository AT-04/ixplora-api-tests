Feature: Put users logout password
  @precondition
  Scenario: APrecondition
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/users/logout/password" end point can performing a "PUT" request
    Given I perform "PUT" request to "/users/logout/password"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "user_response_put_logout_password"
    And I verify that "user_response_put_logout_password" body contains
