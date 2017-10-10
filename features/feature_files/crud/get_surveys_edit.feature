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

  Scenario: Verify that "/surveys/{surveyId}/edit" end point can perform "GET" request.
    Given I perform "GET" request to "/surveys/{survey_response._id}/edit"
    When I set the header "Authorization" with "Bearer {login_response.token}"
    And I send the request
    Then I expect a "200" status code
    And I store the response body as "surveys_response_edit"
    And I verify the "surveys_response_edit" schema with "get_surveys_edit" template
    And I run a query to filter the field "owner" with value "{editor_response._id}" in "surveys"
    And I store the document query result as "survey_data"
    Then I verify that "surveys_response_edit" is persisted in MongoDB as "survey_data"
