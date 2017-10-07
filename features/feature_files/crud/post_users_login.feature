# needs a save request when you set the custom body
@CRUD
Feature: Users login

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"


  Scenario: Verify that "/users/login" end point can perform "POST" request
    Given I perform "POST" request to "/users/login"
    When I set the following custom body:
      | email    | {user_response.primaryEmail} |
      | password | {user_request.password}      |
      | type     | 0                            |
      | app      | MOBILE_APP                   |
    And I send the request
    Then I expect a "200" status code
    And I build the expected response with following data
      | request_name  |                 |
      | response_name | emails_response |
      | template_name | post_user_email |
    Then I verify "clone_surveys_response" with built expected response
