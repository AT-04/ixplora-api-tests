@Functional
Feature: Users login

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"


  Scenario Outline: Verify that "/users/login" end point can perform "POST" request
    Given I perform "POST" request to "/users/login"
    """
    {
      "email": "<EMAIL>",
      "password": "<PASSWORD>"
    }
    """
    And I send the request
    Then I expect a "400" status code
    And I store the response body as "user_login_response"
    Then I verify "user_login_response" with following expected response
    """
      {
      "status": "400",
      "source": "/users/login",
      "detail": "Invalid email or password"
      }
    """

    Examples:
    | EMAIL | PASSWORD |
    |       |          |
    | !"·)% | %&$#!    |
    | &$#!? |          |
    |       | )%"#?!   |

