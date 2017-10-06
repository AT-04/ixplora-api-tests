@Smoke
Feature: Survey

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token
    And I create a survey

  @Delete_created_data
  Scenario Outline:  Verify that "/surveys" end point can perform "GET" request.
    Given I perform "GET" request to "<End Point>"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
    Examples:
      | End Point                                        |
      | /surveys                                         |
      | /surveys/{survey_response._id}                   |
      | /surveys/{survey_response._id}/edit              |
      | /surveys/{survey_response._id}/overview          |
      | /surveys/{survey_response._id}/results?type=json |
      | /surveys/{survey_response._id}/results?type=csv  |
