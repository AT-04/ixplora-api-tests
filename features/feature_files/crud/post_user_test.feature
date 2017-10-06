#Feature: test creation
#
#  Scenario: creation test user
#    Given I register a new "user"
#    Then I verify in MongoDB the field "userId" with value "{user_response._id}" in the "user"
#    Then I verify in CassandraDB the table "table" in the column "col" with value "value"

