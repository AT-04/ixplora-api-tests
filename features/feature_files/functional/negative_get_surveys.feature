@functional @delete_created_data
Feature: Surveys

  Scenario: Invalid Authorization
    Given I perform "GET" request to "/surveys"
    When I set the header "Authorization" with "Bearer 59cfd59f5641d906f70bdb00"
    And I send the request
    Then I expect a "400" status code
    And I store the response body as "surveys_response_get"
    And I verify the "surveys_response_get" schema with "error_response" template
    Then I verify "surveys_response_get" with following expected response
    """
    {
    "statusCode": 401,
    "details": "Not Authorize to continue"
    }
    """

  Scenario: Without Authorization
    Given I perform "GET" request to "/surveys"
    And I send the request
    Then I expect a "400" status code
    And I store the response body as "surveys_response_get"
    And I verify the "surveys_response_get" schema with "error_response" template
    Then I verify "surveys_response_get" with following expected response
    """
   {
    "statusCode": 400,
    "details": "Bad Request"
    }
    """
