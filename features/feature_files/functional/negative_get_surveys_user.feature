@Functional @Delete_created_data
Feature: Surveys

  Background:
    Given I register a new "user" and I save the request as "editor_request"
    When I store the response body as "editor_response"
    And I validate email using "editor_response._id"
    And I login to "MOBILE_APP" using "editor_response.primaryEmail" and "editor_request.password"
    And I store the response body as "login_response"
    And I create a survey with "login_response.token" and I save the request as "survey_request"

  Scenario: Authorization of normal user (non editor)
    Given I perform "GET" request to "/surveys"
    When I set the header "Authorization" with "Bearer {login_response.token}"
    And I send the request
    Then I expect a "401" status code
    And I store the response body as "surveys_response_get"
    And I verify the "surveys_response_get" schema with "error_response" template
    Then I verify "surveys_response_get" with following expected response
    """
      {
        "statusCode": 401,
        "details": "Not Authorize to continue"
       }
    """