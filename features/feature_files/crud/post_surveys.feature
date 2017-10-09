@CRUD
Feature: Create Surveys

  Background:
    Given I register a new "editor" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"
    And I login to "WEB_APP" using "user_response.primaryEmail" and "user_request.password"
    And I store the response body as "login_response"


  Scenario: Verify that "/surveys" end point can perform "POST" request.
    Given I perform "POST" request to "/surveys"
    And I set the header "Authorization" with "Bearer {#{login_response}}"
    When  I set and store the following "#{survey_request}" body
    """
    {
      "_id": "",
      "title": "Questions about sport",
      "description": "These are questions about sport",
      "audience": 0,
      "domains": [],
      "state": 0,
      "releaseDate": "2017-10-07T16:25:23.345Z",
      "creationDate": "2017-10-07T16:25:23.345Z",
      "expirationDate": "2017-10-14T16:25:23.345Z",
      "responseQuantity": 0,
      "questions": []
    }
    """
    And I send the request
    Then I expect a "201" status code
    And I store the response body as "surveys_response"
    Then I verify schema with "post_survey" template and "surveys_response"
    And I build the expected response with following data
      | request_name  | survey_request   |
      | response_name | surveys_response |
      | template_name | post_survey      |
    Then I verify "surveys_response" with built expected response
