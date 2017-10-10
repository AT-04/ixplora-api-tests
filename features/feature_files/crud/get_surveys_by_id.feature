@crud @Delete_created_data
Feature: Surveys

  Background:
    Given I register a new "editor" and I save the request as "editor_request"
    When I store the response body as "editor_response"
    And I validate email using "editor_response._id"
    And I login to "MOBILE_APP" using "editor_response.primaryEmail" and "editor_request.password"
    And I store the response body as "login_response"
    And I create a survey with "login_response.token" and I save the request as "survey_request"
    And I store the response body as "survey_response"
    And I change the "survey_response._id" state to "1" with "login_response.token"

  Scenario: Verify that "/surveys/{surveyId}" end point can perform "GET" request.
    Given I perform "GET" request to "/surveys/{survey_response._id}"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "surveys_response_get"
    And I verify the "surveys_response_get" schema with "post_survey" template
#    And I build the expected response with following data
#      | request_name  | survey_request       |
#      | response_name | surveys_response_get |
#      | template_name | get_surveys          |
#    Then I verify "surveys_response_get" with built expected response
