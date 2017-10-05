Feature: Post Surveys clone
  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token
    And I create a survey

  @CRUD
  Scenario: Verify that "/surveys/{surveyId}/clone" end point can performing "POST" request.
    Given I perform "POST" request to "/surveys/{survey_response._id}/clone"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "201" status code
    And I store the response body as "surveys_response_post_clone"