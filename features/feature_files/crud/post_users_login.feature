@CRUD
Feature: Users login

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"


  Scenario: Verify that "/users/login" end point can perform "POST" request
    Given I perform "POST" request to "/users/login"
    When I set the following custom body:
      | email    | exmaple@gmail.com |
      | password | secret            |
      | type     | 0                 |
      | app      | MOBILE_APP        |
    And I send the request
    Then I expect a "200" status code
