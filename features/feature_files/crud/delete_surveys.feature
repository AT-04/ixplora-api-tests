@crud @Delete_created_data
Feature: Delete Surveys

  Background:
    Given I register a new "editor" and I save the request as "editor_request"
    When I store the response body as "editor_response"
    And I validate email using "editor_response._id"
    And I login to "MOBILE_APP" using "editor_response.primaryEmail" and "editor_request.password"
    And I store the response body as "login_response"
    And I create a survey with "login_response.token" and I save the request as "survey_request"
    And I store the response body as "survey_response"

  Scenario: Verify that "/surveys/{surveyId}" end point can perform "DELETE" request.
    Given I perform "DELETE" request to "/surveys/{survey_response._id}"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "surveys_delete_response"
    And I verify the "surveys_delete_response" schema with "delete_surveys" template
#    And I build the expected response with following data
#      | response_name | surveys_delete_response |
#      | template_name | delete_surveys          |
#    Then I verify "surveys_delete_response" with built expected response
