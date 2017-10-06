@CRUD
Feature: Delete Surveys

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token
    And I create a survey

  Scenario: Verify that "/surveys/{surveyId}" end point can perform "DELETE" request.
    Given I perform "DELETE" request to "/surveys/{survey_response._id}"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "surveys_response_delete"
    And I build the expected response with following data
      | response_name | surveys_response_delete |
      | template_name | delete_surveys          |
    Then I verify "surveys_response_delete" with built expected response
