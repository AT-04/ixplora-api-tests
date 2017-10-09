#This request doesn't have response
@CRUD
Feature: User Logout

  Background:
    Given I register a new "user" and I save the request as "user_request"
    When I store the response body as "user_response"
    And I validate email using "user_response._id"
    And I login to "MOBILE_APP" using "user_response.primaryEmail" and "user_request.password"
    And I store the response body as "login_response"

  Scenario: Verify that "/users/logout/password" end point can perform "PUT" request
    Given I perform "PUT" request to "/users/password"
    When I send the request
    Then I expect a "200" status code
