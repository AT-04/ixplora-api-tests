@CRUD
Feature: Get Surveys

  Background:
    Given I register a new "user" and I store the request as "user_request"
    And I store the response body as "user_response"
    And I validate email using "user_response"
    And I login and get token using "user_response" and "user_request"
    And I store the response body as "login_response"
    And I perform "POST" request to "/surveys"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When  I set and store the following "survey_request" body
    """
    {
    	"audience": 0,
	    "creationDate": "2017-09-29T23:24:54.255Z",
    	"description": "Desc.",
    	"domains": [],
    	"expirationDate": "2017-10-06T23:24:54.255Z",
	    "questions": [],
	    "releaseDate": "2017-09-29T23:24:54.255Z",
    	"responseQuantity": 0,
	    "state": 0,
    	"title": "Test Survey",
    	"_id": ""
    }
    """
    And I send the request
    Then I expect a "201" status code
    And I store the response body as "survey_response"
    And I perform "PUT" request to "/surveys/{survey_response._id}/state"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When  I set and store the following "survey_request" body
    """
    {
     "state": "1"
    }
    """
    And I send the request
    Then I expect a "200" status code

  Scenario: Verify that "/surveys/{surveyId}" end point can perform "GET" request.
    Given I perform "GET" request to "/surveys/{survey_response._id}"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "surveys_response_get"
    And I build the expected response with following data
      | request_name  | survey_request       |
      | response_name | surveys_response_get |
      | template_name | get_surveys          |
    Then I verify "surveys_response_get" with built expected response
