Feature: Post Surveys answers
  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token
    And I create a survey

  @CRUD
  Scenario: Verify that "/surveys/{surveyId}/answers" end point can performing "POST" request.
    Given I perform "POST" request to "/surveys/{survey_response._id}/answers"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    And I set and store the following "answers_request" body
    """
    {
     "answers": [{
      "questionId": "59cfe2e95641d906f70bdb15",
      "answers": "1",
      "type": "singleSelection"
     }],
      "userId": "59cfd3df5641d906f70bdafb"
    }
    """
    When I send the request
    Then I expect a "201" status code