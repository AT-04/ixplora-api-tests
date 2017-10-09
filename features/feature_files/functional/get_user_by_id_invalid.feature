@Functional
Feature: Users get by Id as a negative

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"
    And I login to "MOBILE_APP" using "user_response.primaryEmail" and "user_request.password"
    And I store the response body as "login_response"

  Scenario Outline: Verify tht user is not created with invalid information
    Given I perform "GET" request to "/users/<USER_ID>"
    When I set the header "Authorization" with "bearer <VALUE>"
    And I send the request
    Then I expect a "400" status code
    And I store the response body as "user_response_get"
    And I verify the "user_response_get" schema with "error_response" template
    And I verify "user_response_get" with following expected response
    """
    {
      "status": "400",
      "source": "/users/userId/emails",
      "detail": "Invalid data"
    }
    """
    Examples:
    | USER_ID | VALUE    |
    | null    | 12376324 |
    | ·"#%    |          |