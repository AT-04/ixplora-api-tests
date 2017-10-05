Feature: Get Surveys
  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token
    And I create a survey

  Scenario: Verify that "/surveys/{surveyId}" end point can performing "GET" request.
    Given I perform "GET" request to "/surveys/{survey_response._id}"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "surveys_response_get"
