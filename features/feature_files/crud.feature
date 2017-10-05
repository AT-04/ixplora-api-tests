@crud
Feature: Surveys
  Scenario: I get health
    Given I perform "GET" request to "/health"
    When I send the request
    Then I expect a "200" status code
    And I expect the following JSON response
"""
{
    "Id": "{ServiceId}",
    "Name": "iXplora-Surveys",
    "Version": "{BuildVersion}"
}
"""
    And I verify mongodb
