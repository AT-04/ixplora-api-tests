@CRUD
Feature: Users logout

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/users/logout" end point can perform "POST" request
    Given I perform "POST" request to "/users/logout"
    When I send the request
    Then I expect a "201" status code
    And I store the response body as "logout_response"
    And I verify that "logout_response" body contains
