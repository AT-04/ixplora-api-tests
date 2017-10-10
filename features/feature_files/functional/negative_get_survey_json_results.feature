@functional @delete_created_data
Feature: Survey results

  Background:
    Given I register a new "editor" and I save the request as "editor_request"
    When I store the response body as "editor_response"
    And I validate email using "editor_response._id"
    And I login to "MOBILE_APP" using "editor_response.primaryEmail" and "editor_request.password"
    And I store the response body as "login_response"
    And I create a survey using the Authorization "login_response.token"
    And I store the request body as "survey_request"
    And I store the response body as "survey_request"

  Scenario Outline: Send with invalid parameters
    Given I perform "GET" request to "/surveys/<SURVEY_ID>/results?type=<TYPE>"
    When I set the header "Authorization" with "Bearer {login_response.token}"
    And I send the request
    Then I expect a "404" status code

    Examples:
      |     SURVEY_ID           |       TYPE      |
      |{survey_response._id}    |       jason     |
      |{survey_response._id}    |       csv1      |
      |{survey_response._id}    |                 |
      |{survey_response._id}    |        123      |


