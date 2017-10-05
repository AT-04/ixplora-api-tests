@Smoke
Feature: Server Health

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/users/{userId}" end point can perform "GET" request.
    Given I perform "GET" request to "/users/{user_response._id}"
    And I set the header "Authorization" with "Bearer {login_response.token}"
    When I send the request
    Then I expect a "200" status code
