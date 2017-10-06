@CRUD
Feature: Create a new user

  Scenario: Verify that "/users" end point can perform "POST" request
    Given I register a new "user"
    And I build the expected response with following data
      | request_name         | user_request           |
      | response_name        | user_response          |
      | template_name        | user_creation          |
      | response_expect_name | user_response_expected |
    Then I verify response with the following data
      | expected_result | user_response_expected |
      | actual_result   | user_response          |
