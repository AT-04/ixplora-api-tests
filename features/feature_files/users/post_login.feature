#Feature: Verify login
#
#  Scenario: I verify login
#    Given I perform "POST" request to "/users/login"
#    When  I set the following body:
#  """
#  {
#  "email": "user02@mail.com",
#  "password": "secretixplora"
#  }
#  """
#    Then I expect a "200" status code
#
