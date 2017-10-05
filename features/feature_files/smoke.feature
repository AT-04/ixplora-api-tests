@smoke
Feature: survey
  Scenario: I get health
    Given I perform "GET" request to "/health"
    When I send the request
    Then I expect a "200" status code

  Scenario: I get surveys
    Given I perform "GET" request to "/surveys"
    When I send the request
    Then I expect a "200" status code

  Scenario: I get surveys by id
    Given I perform "GET" request to "/surveys/{survey.id}"
    When I send the request
    Then I expect a "200" status code

  Scenario: I get survey edit
    Given I perform "GET" request to "/surveys/{survey.id}/edit"
    When I send the request
    Then I expect a "200" status code

  Scenario: I get survey overview
    Given I perform "GET" request to "/surveys/{survey.id}/overview"
    When I send the request
    Then I expect a "200" status code

  Scenario: I get survey stats
    Given I perform "GET" request to "/surveys/{survey.id}/results?type=json"
    When I send the request
    Then I expect a "200" status code

  Scenario: I get survey result with json type
    Given I perform "GET" request to "/surveys/{surveyId}/results?type=json"
    When I send the request
    Then I expect a "200" status code

  Scenario: I get survey result with csv type
    Given I perform "GET" request to "/surveys/{surveyId}/results?type=csv  "
    When I send the request
    Then I expect a "200" status code
