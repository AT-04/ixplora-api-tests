#@crud
#Feature: Surveys
#  Scenario: I get health
#    Given I perform "GET" request to "/health"
#    When I send the request
#    Then I expect a "200" status code
#    Then the JSON response should be:
#    """
#     {
#      "Id": "{ServiceId}",
#      "Name": "iXplora-Surveys",
#      "Version": "{BuildVersion}"
#    }
#    """
