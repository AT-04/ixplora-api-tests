@CRUD
Feature: Delete Surveys

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"
    And I login to "MOBILE_APP" using "user_response.primaryEmail" and "user_request.password"
    And I store the response body as "login_response"
    And I create a survey with "login_response.token" and I save the request as "survey_request"
    And I store the response body as "survey_response"

  Scenario: Verify that "/surveys/{surveyId}" end point can perform "DELETE" request.
    Given I perform "DELETE" request to "/surveys/{survey_response._id}"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "surveys_delete_response"
    Then I verify schema with "delete_survey" template and "surveys_delete_response"
    And I build the expected response with following data
      | response_name | surveys_delete_response |
      | template_name | delete_surveys          |
    Then I verify "surveys_delete_response" with built expected response
