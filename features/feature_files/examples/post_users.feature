#Feature: create users
#
#  Scenario: I create a new user
#    Given I perform "POST" request to "/users"
#    When  I set the following body:
#    """
#    {
#     "_id": "",
#     "name": "Demo001",
#     "primaryEmail": "demo001@mail.com",
#     "password": "secretixplora",
#     "birthDate": "2001-01-01T00:00:00.000Z",
#     "secondaryEmails": [],
#     "validated": false,
#     "country": "Bolivia",
#     "city": "Cochabamba",
#     "gender": "Male",
#     "role": "user"
#    }
#    """
#    And I send the request
#    Then I expect a "201" status code
