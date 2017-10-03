Feature: Server health

  Scenario: I get the server health successfully
    Given I perform "GET" request to "/health"
    And I send the request
    Then I expect a "200" status code
