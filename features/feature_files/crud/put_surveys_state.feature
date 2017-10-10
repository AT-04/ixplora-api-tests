@crud @Delete_created_data
Feature: Surveys state

  Background:
    Given I register a new "editor" and I save the request as "editor_request"
    When I store the response body as "editor_response"
    And I validate email using "editor_response._id"
    And I login to "MOBILE_APP" using "editor_response.primaryEmail" and "editor_request.password"
    And I store the response body as "login_response"
    And I create a survey with "login_response.token" and I save the request as "survey_request"
    And I store the response body as "survey_response"
    And I change the "survey_response._id" state to "1" with "login_response.token"

  Scenario: Verify that "/surveys/{surveyId}/state" end point can perform "PUT" request.
    Given I perform "PUT" request to "/surveys/{survey_response._id}/state"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    And I set and store the following "state_request" body
    """
    {
     "state": "1"
    }
    """
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "state_response"
    And I verify the "state_response" schema with "put_surveys_state" template
#    And I build the expected response with following data
#      | request_name  | survey_request    |
#      | response_name | state_response    |
#      | template_name | put_surveys_state |
#    Then I verify "state_response" with built expected response
