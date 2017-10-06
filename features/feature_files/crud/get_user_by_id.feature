@CRUD
Feature: Post tokens

  Background:
    Given I register a new "user"
    And I validate email
    And I login and get token

  Scenario: Verify that "/tokens" end point can perform "POST" request
    Given I perform "GET" request to "/users/{user_response.id}"
    When I send the request
    Then I expect a "200" status code
    And I verify in MongoDB the field "userId" with value "{user_response._id}" in the "user"
    And I store the response body as "user_info_response"

    #Then I verify in CassandraDB the table "table" in the column "col" with value "value"

