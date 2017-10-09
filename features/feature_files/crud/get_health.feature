@CRUD
Feature: health

  Scenario: Verify that "/health" end point can perform "GET" request.
    Given I perform "GET" request to "/health"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "health_response"
    Then I verify schema with "health" template and "health_response"
    And I build the expected response with following data
      | response_name        | health_response           |
      | template_name        | health                    |
    Then I verify "health_response" with built expected response
