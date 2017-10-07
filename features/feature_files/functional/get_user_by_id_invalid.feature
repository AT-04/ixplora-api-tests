@Functional
Feature: Users

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"

  Scenario Outline: Verify that "/users" end point can perform "GET" request
    Given I perform "GET" request to "/users/<id>"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "user_info_response"
    And I verify "user_info_response" with following expected response
    """
    {
      "status": "400",
      "source": "/users/userId/emails",
      "detail": "Invalid data"
    }
    """
    Examples:
    | id   |
    | null |
    |      |
    | ·"#% |