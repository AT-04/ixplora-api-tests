@CRUD
Feature: User Logout

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/users/logout/password" end point can perform "PUT" request
    Given I perform "PUT" request to "/users/password"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "password_response"
    And I verify that "password_response" body contains
