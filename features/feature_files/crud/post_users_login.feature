@CRUD
Feature: Users login

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"

  Scenario: Verify that "/users/login" end point can perform "POST" request
    Given I perform "POST" request to "/users/login"
    When I set the following custom body and store as "user_login_request"
      | email    | {user_response.primaryEmail} |
      | password | {user_request.password}      |
      | type     | 0                            |
      | app      | MOBILE_APP                   |
    And I send the request
    Then I expect a "200" status code
    And I store the response body as "user_login_response"
    Then I verify schema with "user_login" template and "user_login_response"
    And I build the expected response with following data
      | request_name  | user_login_request |
      | response_name | emails_response    |
      | template_name | post_user_email    |
    Then I verify "clone_surveys_response" with built expected response
