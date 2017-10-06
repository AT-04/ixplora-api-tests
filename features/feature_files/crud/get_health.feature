@CRUD
Feature: health

  Scenario: Verify that "/health" end point can perform "GET" request.
    Given I perform "GET" request to "/health"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "health_response"
    And I build the expected response with following data
      | response_name        | health_response           |
      | template_name        | health                    |
      | response_expect_name | health _response_expected |
    Then I verify response with the following data
      | expected_result | health _response_expected |
      | actual_result   | health_response           |
