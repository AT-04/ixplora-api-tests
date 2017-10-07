@Functional
#TODO
Feature: Create a new user with blank or invalid information

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"

  Scenario Outline: Verify the negative responses after POST a new user
    Given I perform "POST" request to "/users/<USER>/emails"
    When  I set and store the following "user_email_request" body
    """
    {
      "email": "<EMAIL>"
    }
    """
    And I send the request
    Then I expect a "404" status code
    And I store the response body as "user_response"
    Then I verify "user_response" with following expected response
    """
    {
     "status": "404",
     "source": "/users/userId/emails",
     "detail": "User does not exist"
    }
    """
    Examples:

    | USER | EMAIL |
    |      | %$·#" |
    | "#%& |       |
    |      |       |
    | $"·" | €#~"= |
