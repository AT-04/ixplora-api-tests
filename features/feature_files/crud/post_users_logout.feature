Feature: Post users logout
  @precondition
  Scenario: APrecondition
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/users/logout" end point can performing a "POST" request
    Given I perform "POST" request to "/users/logout"
    When I send the request
    Then I expect a "201" status code
    And I store the response body as "user_response_post_logout"
    And I verify that "user_response_post_logout" body contains
