@CRUD
Feature: Users login

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/users/login" end point can perform "POST" request
    Given I perform "POST" request to "/users/login"
    When I send the request
    Then I expect a "201" status code
    And I store the response body as "login_response"
    And I verify that "login_response" body contains
