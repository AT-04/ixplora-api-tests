@CRUD
Feature: health

  Scenario: Verify that "/health" end point can perform "GET" request.
    Given I perform "GET" request to "/health"
    When I send the request
    Then I expect a "200" status code
    And I store the response body as "health_response"
    And I verify that "health_response" body contains
    """
    {
      "Id": "{ServiceId}",
      "Name": "iXplora-Surveys",
      "Version": "0.1.5"
    }
    """
