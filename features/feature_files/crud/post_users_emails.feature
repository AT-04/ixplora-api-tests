@CRUD
Feature: User email

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/users/{userId}/emails" end point can perform "POST" request
    Given I perform "POST" request to "/users/{userId}/emails"
    When I send the request
    Then I expect a "201" status code
    And I store the response body as "emails_response"
    And I verify that "emails_response" body contains
