Feature: create users

  Scenario: I create a new user
    Given I perform "POST" request to "/users/logout"
    When  I set the following body:
"""
{
 "id": "59d17e5ed5b18306854a80c1"
}
"""
    Then I expect a "201" status code
    And I expect the following JSON response
"""
{
    "id": "59d17e5ed5b18306854a80c1"
}s
"""
    And I verify the data bases
