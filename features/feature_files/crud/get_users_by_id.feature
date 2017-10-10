@crud @Delete_created_data
Feature: Users

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"
    And I login to "MOBILE_APP" using "user_response.primaryEmail" and "user_request.password"
    And I store the response body as "login_response"

  Scenario: Verify that "/users/{user.id}" end point can perform "GET" request
    Given I perform "GET" request to "/users/{user_response._id}"
    When I set the header "Authorization" with "Bearer {login_response.token}"
    And I send the request
    Then I expect a "200" status code
    And I store the response body as "user_info_response"
    And I verify the "user_info_response" schema with "get_user_id" template
#    And I build the expected response with following data
#      | request_name  | user_request       |
#      | response_name | user_info_response |
#      | template_name | user_creation      |
#    Then I verify "user_info_response" with built expected response
