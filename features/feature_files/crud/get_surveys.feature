@CRUD
Feature: Get Surveys

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"
    And I login to "MOBILE_APP" using "user_response.primaryEmail" and "user_request.password"
    And I store the response body as "login_response"
    And I create a survey with "login_response.token" and I save the request as "survey_request"
    And I store the response body as "survey_response"
    And I change the "survey_response._id" state to "1" with "login_response.token"

  Scenario: Verify that "/surveys/{surveyId}" end point can perform "GET" request.
    Given I perform "GET" request to "/surveys/{survey_response._id}"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "get_surveys_response"
    Then I verify schema with "get_surveys" template and "get_surveys_response"
    And I build the expected response with following data
      | request_name  | survey_request       |
      | response_name | get_surveys_response |
      | template_name | get_surveys          |
    Then I verify "surveys_response_get" with built expected response
