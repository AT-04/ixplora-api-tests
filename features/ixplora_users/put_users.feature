Feature: Post the logout

  Scenario: I post the logout of the user
    Given I perform "POST" request to "/users/logout"
    When  I send the user "ID"
    Then I expect a '200' status code