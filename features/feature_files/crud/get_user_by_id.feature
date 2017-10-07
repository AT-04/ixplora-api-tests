@CRUD
Feature: Users

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"

  Scenario: Verify that "/tokens" end point can perform "POST" request
    Given I perform "GET" request to "/users/{user_response.id}"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "user_info_response"
    And I build the expected response with following data
      | request_name  | user_request       |
      | response_name | user_info_response |
      | template_name | user_creation      |
    Then I verify "user_info_response" with built expected response
    Then I verify in MongoDB the field "userId" with value "{user_response._id}" in the "user"
