@Functional
#TODO
Feature: Negative expected for POST an Email

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"
    And I login to "MOBILE_APP" using "user_response.primaryEmail" and "user_request.password"
    And I store the response body as "login_response"

  Scenario Outline: Verify the negative responses after POST the Email
    Given I perform "POST" request to "/users/<USER_ID>/emails"
    When I set the header "Authorization" with "Bearer <VALUE>"
    And I set and store the following "user_request_email" body
    """
    {
      "email": "<EMAIL>"
    }
    """
    And I send the request
    Then I expect a "404" status code
    And I store the response body as "email_response_post"
    And I verify the "email_response_post" schema with "error_response" template
    And I verify "email_response_post" with following expected response
    """
    {
     "status": "404",
     "source": "/users/userId/emails",
     "detail": "User does not exist"
    }
    """
    Examples:

    | USER_ID | EMAIL | VALUE |
    |         | %$·#" |       |
    | "#%&    |       |       |
    |         |       |       |
    | $"·"    | €#~"= |       |
    |         | %$·#" | 1234  |
    | "#%&    |       | 9583  |
    |         |       | 3455  |
    | $"·"    | €#~"= | 5667  |