@CRUD
Feature: Surveys state

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token
    And I create a survey

  Scenario: Verify that "/surveys/{surveyId}/state" end point can perform "PUT" request.
    Given I perform "PUT" request to "/surveys/{survey_response._id}/state"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    And I set and store the following "state_request" body
    """
    {
     "state": "3"
    }
    """
    When I send the request
    Then I expect a "200" status code
